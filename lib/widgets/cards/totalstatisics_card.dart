import 'package:dashbord/helper/const.dart';
import 'package:flutter/material.dart';

class TotalstatisicsCard extends StatelessWidget {
  const TotalstatisicsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
    BoxShadow(
      // ignore: deprecated_member_use
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 2,
      offset: const Offset(0, 3), 
    ),
  ],  
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Bookings', style: TextStyle(fontSize: 16,color: grayColor)),
                      const Text('150', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Icon(Icons.bar_chart, size: 80, color: primaryColor),
                ],
              ),
            );
  }
}