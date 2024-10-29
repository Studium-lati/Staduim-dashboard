import 'package:dashbord/helper/const.dart';
import 'package:dashbord/widgets/cards/notification_card.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:flutter/material.dart';



class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: getScreenSize(context).width * 0.26,
                  height: getScreenSize(context).height * 0.05,
                  child: Mainbutton(
                    text: 'pending',
                    ontap: () {},
                    textsize: 14,
                    paddingbutten: EdgeInsets.only(),
                  ),
                ),
                Container(
                  width: getScreenSize(context).width * 0.28,
                  height: getScreenSize(context).height * 0.05,
                  child: Mainbutton(
                    text: 'Accepted',
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

            Expanded(
              child: ListView(
                children: [
                  NotificationCard(),
                  NotificationCard(),
                  NotificationCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}




