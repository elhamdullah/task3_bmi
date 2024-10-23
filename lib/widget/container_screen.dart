import 'package:flutter/material.dart';
import 'package:task3_bmi/constant/color_page.dart';
class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key, required this.icon, required this.label, required this.color});

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    bool isMale = true;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: mediaquery.width*0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size: mediaquery.width*0.2,color: color_constant.colorText,),
          Text(label,style: TextStyle(fontSize: mediaquery.width*0.05,color: color_constant.colorSubResult),),
        ],
      ),
    );
  }
}
