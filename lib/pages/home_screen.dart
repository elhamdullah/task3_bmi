import 'package:flutter/material.dart';
import 'package:task3_bmi/constant/color_page.dart';
import 'package:task3_bmi/pages/result_screen.dart';
import '../widget/container_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  int counterW=7;
  int counterH=10;
  double height = 120.0;
  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color_constant.colorScaffold,

      //appBar put BMI text and center the title of the app with white color
      appBar: AppBar(
        toolbarHeight: mediaquery.height*0.1,
        centerTitle: true,
        backgroundColor: color_constant.colorScaffold,
        title: Text("BMI Calculator",style: TextStyle(
            color: color_constant.colorText,
            fontWeight: FontWeight.bold,
            fontSize: mediaquery.width*0.06
        ),
        ),
      ),

      //body of app (three container)male/female and height/weight/age
      body: Column(
        children: [
          //container of male and female
          Expanded(
            child: Container(
              color: color_constant.colorScaffold,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: ContainerScreen(
                        icon: Icons.male,
                        label: "Male",
                        color: isMale ? color_constant.colorButton : color_constant.colorContainer,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: ContainerScreen(
                        icon: Icons.female,
                        label: "Female",
                        color: isMale ? color_constant.colorContainer : color_constant.colorButton,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //container of height by using slider widget
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: mediaquery.width*0.02,vertical: mediaquery.height*0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color_constant.colorContainer,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height",style: TextStyle(fontSize: mediaquery.width*0.06,color: color_constant.colorSubResult),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style: TextStyle(fontSize: mediaquery.width*0.1,color: color_constant.colorText,fontWeight: FontWeight.bold),),
                      Text("cm",style: TextStyle(fontSize: mediaquery.width*0.05,color: color_constant.colorSubResult,),),
                    ],
                  ),
                  Slider(
                    activeColor: color_constant.colorButton,
                    inactiveColor:  color_constant.colorSubResult,
                    value: height.round().toDouble(),
                    label: height.toString(),
                    divisions: 50,
                    min: 0,
                    max: 200,
                    onChanged: (value) {
                      setState(() {
                        height=value;
                      });
                    },)
                ],
              ),
            ),
          ),

          //container of weight and age
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: mediaquery.width*0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color_constant.colorContainer,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight",style: TextStyle(fontSize: mediaquery.width*0.06,color: color_constant.colorSubResult),),
                        Text(counterW.toString(),style: TextStyle(fontSize: mediaquery.width*0.1,color: color_constant.colorText,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor: color_constant.colorAddSubButton,
                              onPressed: () {
                                setState(() {
                                  counterW++;

                                });
                              },
                              child: Icon(Icons.add,color: color_constant.colorText,),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),

                            SizedBox(width: mediaquery.width*0.05,),

                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor: color_constant.colorAddSubButton,
                              onPressed: (){
                                setState(() {
                                   counterW--;
                                });
                              },
                              child: Icon(Icons.remove,color: color_constant.colorText,),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: mediaquery.width*0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color_constant.colorContainer,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age",style: TextStyle(fontSize: mediaquery.width*0.06,color: color_constant.colorSubResult),),
                        Text(counterH.toString(),style: TextStyle(fontSize: mediaquery.width*0.1,color: color_constant.colorText,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor: color_constant.colorAddSubButton,
                              onPressed: () {
                                setState(() {
                                  counterH++;

                                });
                              },
                              child: Icon(Icons.add,color: color_constant.colorText,),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),

                            SizedBox(width: mediaquery.width*0.05,),

                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor: color_constant.colorAddSubButton,
                              onPressed: (){
                                setState(() {
                                   counterH--;
                                });
                              },
                              child: Icon(Icons.remove,color: color_constant.colorText,),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: mediaquery.height*0.03,),

          //button click calculate and navigate to another page to review result
          ElevatedButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                ResultScreen(gender:isMale?"Male":"female" , weight: counterW.toDouble(),height:height ,age:counterH,),));
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: color_constant.colorButton,
              padding: EdgeInsets.symmetric(vertical: mediaquery.height*0.018,horizontal: mediaquery.width*0.37),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
            ),),
              child: Text("Calculate",style: TextStyle(color: color_constant.colorText,fontSize: mediaquery.width*0.06),),
          )
        ],
      ),
    );
  }
}

