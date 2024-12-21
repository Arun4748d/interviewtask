import 'package:flutter/material.dart';
import 'package:tastsample/utils/colorconstant.dart';
import 'package:tastsample/view/Dummydb.dart';
import 'package:tastsample/view/resultscreen/resultscreen.dart';

class Questionscreen extends StatefulWidget {
  const Questionscreen({super.key});

  @override
  State<Questionscreen> createState() => _QuestionscreenState();
}

class _QuestionscreenState extends State<Questionscreen> {
  int questionindex = 0;
  String? selectedanswer;  

  int totalrightanswer = 0;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconstant.white,
        actions: [
          Text(
            "${questionindex + 1}/${Dummydb.taskQuestions.length}",
            style: TextStyle(
              color: Colorconstant.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
   // Question section
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 350,
                width: double.infinity,
                child: Center(
                  child: Text(
                    Dummydb.taskQuestions[questionindex]["question"],
                    style: TextStyle(
                      color: Colorconstant.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 3,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colorconstant.lightblue,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      spreadRadius: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),

  // Options section
          Expanded(
            child: Column(
              children: List.generate(
                Dummydb.taskQuestions[questionindex]["options"].length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: InkWell(
                    onTap: () {
                      setState(() {
     
                             if(selectedanswer==null){
                          selectedanswer = Dummydb.taskQuestions[questionindex]["options"][index]; 
                          print(selectedanswer);
                        } 

                       
                        if (selectedanswer == Dummydb.taskQuestions[questionindex]["answer"]) {
                          totalrightanswer++;
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            Dummydb.taskQuestions[questionindex]["options"][index],
                            style: TextStyle(
                              color: Colorconstant.bluee,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: getColor(Dummydb.taskQuestions[questionindex]["options"][index]),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

    // Next button
          if (selectedanswer != null)
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedanswer = null; 
                  if (questionindex < Dummydb.taskQuestions.length - 1) {
                    questionindex++; 
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Resultscreen(
                          rightanswer: totalrightanswer, 
                        ),
                      ),
                    );
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color:Colorconstant.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colorconstant.lightblue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

// color function

  Color getColor(String currentOption) {
    if (selectedanswer != null) {
     
      if (currentOption == Dummydb.taskQuestions[questionindex]["answer"]) {
        return Colorconstant.green;
      }
      
      else if (currentOption == selectedanswer) {
        return Colorconstant.red;
      }
    }
    return Colorconstant.black;  
  }
}
