import 'package:dashbord/provider/staduim_provider.dart';

import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  void initState() {
    super.initState();
    Provider.of<StaduimProvider>(context, listen: false).getStaduim();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StaduimProvider>(
      builder: (context, staduimconsumer, _) {
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
               //   image: DecorationImage(
              //      image: NetworkImage(staduimconsumer.StaduimProvider.image),
               //     fit: BoxFit.cover,
                  ),
              //  ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Stadium Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Mainbutton(text: "Manage", ontap: () {}),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}