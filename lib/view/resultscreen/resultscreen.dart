import 'package:flutter/material.dart';
import 'package:tastsample/utils/colorconstant.dart';
import 'package:tastsample/view/Dummydb.dart';
import 'package:tastsample/view/questionscreen/questionScreen.dart';


class Resultscreen extends StatefulWidget {
  const Resultscreen({required this.rightanswer,super.key});
    final int rightanswer;
  
  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
  int questionindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Center(
        child: Padding(padding: 
        EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            
            Text("congratulations",style: TextStyle(
             color:Colorconstant.black,
             fontSize: 25,
             fontWeight: FontWeight.bold,
            ),),
             SizedBox(height: 15),
               Text("Your score",style: TextStyle(
             color: Colorconstant.black,
             fontSize: 23,
             fontWeight: FontWeight.bold,
            ),),

            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                color: Colorconstant.grey,
                borderRadius: BorderRadius.circular(18)
              ),
              child: Center(child: Text("${widget.rightanswer}/${Dummydb.taskQuestions[questionindex].length-1}",
              style: TextStyle(
                color: Colorconstant.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                
              ),)),
            ),
            SizedBox(height: 8,),
            GestureDetector(
              onTap: () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Questionscreen(),),
        (Route<dynamic> route) => false,);
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colorconstant.lightblue,
                  borderRadius: BorderRadius.circular(18)
                ),
                child: Center(child: Text("Restart",style:TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Colorconstant.black,
                 fontSize: 18,
                ),),
                ),
              ),
            )

          ],
        ),
        
        ),
      ),
    );
  }
}