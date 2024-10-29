import 'package:dashbord/helper/const.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:flutter/material.dart';


class StadiumCard extends StatelessWidget {
  final String title;
  final String date;
  final String imagePath;
  final String location ;
  final String? titleboutton ;

  const StadiumCard({
    Key? key,
    required this.title,
    required this.date,
    required this.imagePath, required this.location,  this.titleboutton,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:5 ,top:5 ),
      child: Container(
       
          decoration: BoxDecoration(  border: Border.all(
                color: grayColor, 
                width: 0.5,  
                   

              ),
              borderRadius: BorderRadius.circular(10),
          
         
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                   title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                     "Date:"+ date,
                      style: TextStyle(
                        fontSize: 14,
                        color: grayColor
                      ),
                    ),
                    Text(
                     "Location::"+ location,
                      style: TextStyle(
                        fontSize: 14,
                        color: grayColor
                      ),
                    ),
                    SizedBox(height: 10),
                   
                      Container(
                        width: getScreenSize(context).width * 0.27,
                        child: Mainbutton(text: titleboutton ?? ' View Details', ontap: (){}, backgroundColor: Colors.white,
                        textcolor: primaryColor,
                        textsize: 14,
                        strokeColor: primaryColor,
                        selected: false,
                                  
                        ),
                      ),
          
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Image.asset(
                 imagePath,
           
                  fit: BoxFit.cover,
                  height: getScreenSize(context).height * 0.18,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
