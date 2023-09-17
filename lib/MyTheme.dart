import 'package:flutter/material.dart';

class MyTheme{
  //colors, lighttheme,darktheme
  static Color primarylight=Color(0xffB7935F);
  static Color blackcolor=Color(0xff242424);
  static Color whitecolor=Colors.white;
  static Color secondcolor=Color(0xbeb7935f);
  static Color yellowcolor=Color(0xffFACC1D);
  static Color primarydark=Color(0xff141A2E);
  static Color Seconddark=Color(0xcb141a2e);
  static ThemeData light_theme=ThemeData(
    // canvasColor: primarylight,
    primaryColor:primarylight ,
    scaffoldBackgroundColor:Colors.transparent,
    appBarTheme:AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
        // titleTextStyle:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:blackcolor),
      centerTitle: true,
      iconTheme:IconThemeData(color:blackcolor)
    ),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:blackcolor,),
        titleMedium: TextStyle(fontWeight:FontWeight.w500,fontSize: 25,color: blackcolor),
        titleSmall: TextStyle(fontWeight:FontWeight.w300,fontSize: 20,color: blackcolor),
        bodyLarge:  TextStyle(fontSize:25,fontWeight: FontWeight.bold,color:blackcolor),



  ),
      // bottomNavigationBarTheme:BottomNavigationBarThemeData(backgroundColor:blackcolor) bug
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor:blackcolor,
      unselectedItemColor: whitecolor,
        showUnselectedLabels: true
    )
  );
  static ThemeData dark_theme=ThemeData(
    // canvasColor: primarylight,
      primaryColor:primarydark ,
      scaffoldBackgroundColor:Colors.transparent,
      appBarTheme:AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // titleTextStyle:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:blackcolor),
          centerTitle: true,
          iconTheme:IconThemeData(color:whitecolor)
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:whitecolor,),
        titleMedium: TextStyle(fontWeight:FontWeight.w500,fontSize: 25,color: whitecolor),
        titleSmall: TextStyle(fontWeight:FontWeight.w300,fontSize: 20,color: yellowcolor),
        bodyLarge:  TextStyle(fontSize:25,fontWeight: FontWeight.bold,color:yellowcolor),



      ),
      // bottomNavigationBarTheme:BottomNavigationBarThemeData(backgroundColor:blackcolor) bug
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor:yellowcolor,
          unselectedItemColor: whitecolor,
          showUnselectedLabels: true
      )
  );
}