import 'package:dashbord/helper/const.dart';
import 'package:flutter/material.dart';

class HomeCart extends StatelessWidget {
  const HomeCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container (
        width: getScreenSize(context).width * 0.75,
        height: getScreenSize(context).height * 0.22,
        
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 3,
        blurRadius: 3,
        offset: Offset(0, 3), 
      ),
        ],  
      ),  
      child: Column(
        children: [
      Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          "assets/download.png",
          width: getScreenSize(context).width * 0.5,
          height: getScreenSize(context).height * 0.1,    
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Total Sales',
            style: TextStyle(
              fontSize: 20,
             
              color: Colors.grey
            ),
          ),
        
        ),
      ),
      Row(
        children: [
          Icon(Icons.attach_money,color: primaryColor,size: 30,),
          Text("500",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ],
      )
        ],
      ),  
        
      ),
    );
  }
}