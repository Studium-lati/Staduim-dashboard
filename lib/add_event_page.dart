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
       body: DefaultTabController(
              length: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, ),  
                child: Column(
                  children: [
                    TabBar(
                        isScrollable: false,
                        unselectedLabelColor: grayColor,
                        indicatorColor:primaryColor,
                        dividerColor: Colors.black,
                        labelColor: primaryColor,
                        dividerHeight: 0,                        
                        tabs: [
                          Tab(
                            text: "Add Event",
                
                          ),
                          Tab(
                          text:   "Events",
                          )
                        ]),
                    Expanded(
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                           
                                 Padding(
                                   padding: const EdgeInsets.only(top: 24,left: 16,right: 16),
                                   child: Column(
                                     children: [
                                       AddEventCard(),
                                       SizedBox(height: 20,),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                                                                
                                                         width: getScreenSize(context).width * 0.3,
                                                         height: getScreenSize(context).height * 0.06,
                                                         child: Mainbutton(text: "Add Event",textsize: 12,
                                                         icon: Icons.calendar_today, 
                                                         
                                                          ontap: () {}, 
                                          
                                                          ),
                                                                             
                                                                                ),
                                        ),
                                     ],
                                   ),
                                 ),
                                 
                            
                            ListView.builder(
                              padding: const EdgeInsets.all(24),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return StadiumCard(
                      title: "Hamidha League", 
                      date: "12/12/2021",
                       imagePath: "assets/308ef14d-4473-4eb3-8ab3-26c1db6b8c26.jpeg",
                       location: 'Benghazi',);
                                        }),
                          ]
                      )
                    )
                          
                          
                          ]
                ),
              )
                        )
    );      
                        }
                        }
      
      
     

