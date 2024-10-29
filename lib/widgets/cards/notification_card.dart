import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sure you want to accept?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '28-2-2024 Monday 9:00 to 10:00',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                            Mainbutton(text: "No, cancel", 
                            textcolor: Colors.black,
                            strokeColor: Colors.black,
                            backgroundColor: Colors.white,

                            ontap: (){},paddingbutten: EdgeInsets.only(left: 18,right: 18),),

             Mainbutton(text: "Yes, Confirm", ontap: (){},paddingbutten: EdgeInsets.only(left: 18,right: 18),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}