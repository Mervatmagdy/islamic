
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/Home_Screen.dart';
import 'package:islamic/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName='splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacementNamed(Home_Screen.routeName);
    });
  }
  @override
  void dispose(){

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays:SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
          body:
          provider.isDarkMode()?  Image.asset('assets/images/splash_screen_dark.png',fit: BoxFit.fill,height: double.infinity,width: double.infinity):
          Image.asset('assets/images/splash_screen.png',fit: BoxFit.fill,height: double.infinity,width: double.infinity)
      ),
    );
  }
}
