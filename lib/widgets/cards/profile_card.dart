import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:flutter/material.dart';

class profileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              image: DecorationImage(
                image: AssetImage('assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg',
          
                  
                ), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stadium Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
               Mainbutton(text: "Mange", ontap: (){})
              ],
            ),
          ),
        ],
      ),
    );
  }
}