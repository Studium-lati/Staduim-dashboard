import 'package:dashbord/helper/const.dart';
import 'package:dashbord/widgets/cards/stadium_card.dart';
import 'package:dashbord/widgets/cards/totalstatisics_card.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:dashbord/widgets/inputs/search_text.dart';
import 'package:flutter/material.dart';



class BookingsManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white   ,
     
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bookings Management', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        SearchText(searchController: TextEditingController(), Paddingleft: 0,Paddingrighr: 0,),

            SizedBox(height: 16),
            
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: getScreenSize(context).width * 0.26,
                  height: getScreenSize(context).height * 0.05,
                  child: Mainbutton(
                    text: 'Weekly',
                    ontap: () {},
                    textsize: 14,
                    paddingbutten: EdgeInsets.only(),
                  ),
                ),
                Container(
                  width: getScreenSize(context).width * 0.28,
                  height: getScreenSize(context).height * 0.05,
                  child: Mainbutton(
                    text: 'yearly',
                    ontap: () {},
                    textsize: 14,
                    textcolor: grayColor,
                    backgroundColor: Colors.white,
                  ),
                ),
                Container(
                  width: getScreenSize(context).width * 0.28,
                  height: getScreenSize(context).height * 0.05,
                  child: Mainbutton(
                    text: 'All',
                    ontap: () {},
                    textsize: 14,
                    textcolor: grayColor,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            Text('Statistics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TotalstatisicsCard(),
            SizedBox(height: 16),

            Text('Bookings Table', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Container(
            width:getScreenSize(context).width*0.44,
            child: Mainbutton(text: "Add New Booking", ontap: (){})),
            SizedBox(height: 16),

           StadiumCard(
            titleboutton: "edit",
            title: "Booking Details", 
            date: "12/12/2021",
             imagePath: "assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg",
             location: 'Benghazi',),

          ],
        ),
      ),
    );
  }
}


