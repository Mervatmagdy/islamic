import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
class AppConfigProvider extends ChangeNotifier  {
  static late SharedPreferences prefs;

//data
  String appLanguage = 'en';
  late  ThemeMode appTheme=getChangeTheming();
  Future<void> changeLanguage(String newLanguage) async {
    if (newLanguage == appLanguage) {
      return;
    }else{
      appLanguage = newLanguage;
      prefs.setString('AppLanguage', appLanguage);
    }
    notifyListeners();
  }
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> changeTheming(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
     return;
    }appTheme = newTheme;
      setChangeTheming();
      notifyListeners();
  }

  bool isDarkMode() {
    return appTheme==ThemeMode.dark;
  }

  static String? getAppLanguage(String key) {
    return prefs.getString(key);
  }
   setChangeTheming()  async {
    if(appTheme==ThemeMode.light){
      prefs.setBool('ChangeTheming', true);
    }else if (appTheme==ThemeMode.dark)
    {prefs.setBool('ChangeTheming', false);

    };

  }
 getChangeTheming()   {
    if(prefs.getBool('ChangeTheming')==true){
        appTheme=ThemeMode.light;
        return appTheme;
    }else if(prefs.getBool('ChangeTheming')==false) {
    appTheme=ThemeMode.dark;
    return appTheme;

    }else{
      return appTheme=ThemeMode.light;
    }


  }
}