import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
//data
String appLanguage='en';
ThemeMode appTheme=ThemeMode.light;
void changeLanguage(String newLanguage){
  if(newLanguage==appLanguage){
    return;
  }
  appLanguage=newLanguage;
  notifyListeners();
}
void changeTheming(ThemeMode newTheme){
  if(appTheme==newTheme){
    return;
  }
  appTheme=newTheme;
  notifyListeners();
}
bool isDarkMode(){
  return appTheme==ThemeMode.dark;
}
}
