import 'package:dashbord/helper/const.dart';
import 'package:dashbord/widgets/cards/add_event_card.dart';
import 'package:dashbord/widgets/cards/stadium_card.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  const 
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60,left: 20),
              child: Text("Event Management",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 40,),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: AddEventCard()),
              Align(
                alignment: FractionalOffset.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: getScreenSize(context).width * 0.3,
                    height: getScreenSize(context).height * 0.06,
                    child: Mainbutton(text: "Add Event",textsize: 12,
                    
                    
                     ontap: () {},icon: Icons.calendar_today,),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              
                child: Column(
                  children: [
                    StadiumCard(
                    title: "Hamidha League", 
                    date: "12/12/2021",
                     imagePath: "assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg",
                     location: 'Benghazi',),
            StadiumCard(
              title: "Hamidha League", 
              date: "12/12/2021",
              imagePath: "assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg",
              location: 'Benghazi',
            ),
          ],
                ),
                
              ),
        
          ],
        ),
      ),
    );
  }
}