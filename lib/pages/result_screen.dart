import 'package:flutter/material.dart';

import '../constant/color_page.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.weight, required this.age, required this.height, required this.gender});
  final double weight;
  final int age;
  final double height;
  final String gender;


  
  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    var result=weight/((height/100)*(height/100));

    return Scaffold(
      backgroundColor: color_constant.colorScaffold,
      appBar: AppBar(
        iconTheme: IconThemeData(color: color_constant.colorText,),
        toolbarHeight: mediaquery.height*0.1,
        centerTitle: true,
        backgroundColor: color_constant.colorScaffold,
        title:  Text("BMI Calculator",style: TextStyle(
          color: color_constant.colorText,
          fontWeight: FontWeight.bold,
          fontSize: mediaquery.width*0.06
        ),
        ),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Your Result",style: TextStyle(
            color: color_constant.colorText,
            fontWeight: FontWeight.bold,
            fontSize: mediaquery.width*0.1
          ),
          ),

          Expanded(
            child: Container(
            width: mediaquery.width*0.95,
            margin: EdgeInsets.symmetric(vertical: mediaquery.height*0.05,horizontal: mediaquery.width*0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color_constant.colorContainer,
            ),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(result<18.5?"Underweight":result<24.9?"Normal":result<29.9?"Overweight":"Obese",
                  style: TextStyle(
                  color: color_constant.colorResult,
                  fontWeight: FontWeight.bold,
                  fontSize: mediaquery.width*0.1
                ),),

                Text(result.toStringAsFixed(2),style: TextStyle(
                  color: color_constant.colorText,
                  fontSize: mediaquery.width*0.25,
                  fontWeight: FontWeight.bold
                )),

                Text(result<18.5?"Possible nutritional deficiency and osteoporosis.":result<24.9?"Low risk (healthy range).":result<29.9?"Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.":"High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome.",style: TextStyle(
                  color: color_constant.colorSubResult,
                  fontSize: mediaquery.width*0.065),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

          ),),
          ElevatedButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                HomeScreen()));
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: color_constant.colorButton,
              padding: EdgeInsets.symmetric(vertical: mediaquery.height*0.018,horizontal: mediaquery.width*0.32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),),
            child: Text("Re-Calculate",style: TextStyle(color: color_constant.colorText,fontSize: mediaquery.width*0.06),),
          )
        ],
      ),
    );
  }
}
