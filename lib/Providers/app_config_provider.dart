import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
class AppConfigProvider extends ChangeNotifier  {
  static late SharedPreferences prefs;

//data
  late String appLanguage =getAppLanguage()?? 'en';
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

   getAppLanguage() {
    return prefs.getString("AppLanguage");
  }
   setChangeTheming()  async {
    if(appTheme==ThemeMode.light){
      prefs.setBool('ChangeTheming', true);
    }else
    {prefs.setBool('ChangeTheming', false);

    };

  }
 getChangeTheming()   {
    if(prefs.getBool('ChangeTheming')==true){
        return ThemeMode.light;
    }else if(prefs.getBool('ChangeTheming')==false) {

    return ThemeMode.dark;

    }else{
      return ThemeMode.light;
    }


  }
}