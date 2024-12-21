import 'package:flutter/material.dart';
import 'package:tastsample/utils/colorconstant.dart';

import 'package:tastsample/view/splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        scaffoldBackgroundColor: Colorconstant.white,
      ),
     home: Splashscreen(
    
     ),
    );
  }
}
