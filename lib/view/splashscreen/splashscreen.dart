import 'package:flutter/material.dart';
import 'package:tastsample/utils/colorconstant.dart';
import 'package:tastsample/view/questionscreen/questionScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Questionscreen(),));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
   Center(
     child: Text("Quiz App",style: TextStyle(
      color:Colorconstant.black,
      fontWeight: FontWeight.bold,
      fontSize: 50,
     ),),
   )
        ],
      ),
    );
  }
}