import 'package:flutter/material.dart';
import 'package:islamic/Hadeth/Hadeth_details.dart';
import 'package:islamic/Home_Screen.dart';
import 'package:islamic/MyTheme.dart';
import 'package:islamic/Providers/app_config_provider.dart';
import 'package:islamic/Quran/Sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/splash_screen.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider(
    create: (context) =>AppConfigProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
   return MaterialApp(locale:Locale(provider.appLanguage),
themeMode:provider.appTheme,
     darkTheme:MyTheme.dark_theme,
     localizationsDelegates: AppLocalizations.localizationsDelegates,
     supportedLocales: AppLocalizations.supportedLocales,
     debugShowCheckedModeBanner: false,
     initialRoute:SplashScreen.routeName ,
     routes:{
     SplashScreen.routeName:(context) => SplashScreen(),
       Home_Screen.routeName:(context) => Home_Screen(),
       Sura_detail.routeName:(context) => Sura_detail(),
       Hadeth_detail.routeName:(context) => Hadeth_detail()
     },
     theme:MyTheme.light_theme,
   );
  }
}
