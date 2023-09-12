import 'package:flutter/material.dart';
import 'package:islamic/Home_Screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute:Home_Screen.routeName ,
     routes:{
       Home_Screen.routeName:(context) => Home_Screen()
     },
   );
  }
}
