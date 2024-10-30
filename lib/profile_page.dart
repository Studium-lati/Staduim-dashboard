import 'package:dashbord/helper/const.dart';

import 'package:dashbord/provider/auth_provider.dart';
import 'package:dashbord/widgets/cards/profile_card.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AdminProfilePage extends StatefulWidget {
  @override
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  @override
  void initState() {
    Provider.of<AuthenProvider>(context, listen: false).getUser();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(
      builder: (context,authconsumer,_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            
            title: Text("Admin Profile", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(authconsumer.profileModel?.avatar ?? 'https://via.placeholder.com/150'),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(authconsumer.profileModel?.name ?? 'Non', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("Role: " + (authconsumer.profileModel?.role ?? 'Unknown'), style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 8),
                        Mainbutton(text: "Edit Profile", ontap: (){},paddingbutten: EdgeInsets.only(left: 20,right: 20),)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Stadiums Management', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(
                    width: getScreenSize(context).width * 0.3,
                    height: getScreenSize(context).height * 0.015,
        
        
                    child: LinearProgressIndicator(
                      value: 1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                      
                      color: primaryColor,
                    ),
                  ),
                  ],
                ),
                SizedBox(height: 16),
        
                GridView.builder(
        
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 6, 
                  itemBuilder: (context, index) {
                //    return profileCard();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

