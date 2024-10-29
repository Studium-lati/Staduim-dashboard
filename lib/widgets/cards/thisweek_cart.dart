import 'package:dashbord/helper/const.dart';
import 'package:dashbord/helper/function_helper.dart';
import 'package:flutter/material.dart';

class ThisweekCart extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const ThisweekCart({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
     required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0,bottom: 8,right: 10,left: 10),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
              
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10,),

                  CircleAvatar(
                  backgroundColor:backgroundColor.withOpacity(0.2),
                  
                  child: Icon(icon, color: iconColor, size: 24)),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Icon(
                  Icons.arrow_upward,
                  color: primaryColor,
                  size: 10,
                ),
                Text("5.1%",
                  style: TextStyle(fontSize: 10, color: primaryColor),
                ),
                Text(
                  "Up from past week",
                  style: TextStyle(fontSize: 12, color: grayColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
  }
}
