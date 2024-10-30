// import 'dart:io';

import 'package:dashbord/helper/const.dart';
import 'package:dashbord/provider/event_provider.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:dashbord/widgets/inputs/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddEventCard extends StatefulWidget {

   AddEventCard({super.key});

  @override
  State<AddEventCard> createState() => _AddEventCardState();
}

class _AddEventCardState extends State<AddEventCard> {
    final TextEditingController _title = TextEditingController();
    final TextEditingController _Description = TextEditingController();
    final TextEditingController _DateController = TextEditingController();
    // final TextEditingController _ImageController = TextEditingController();


      GlobalKey<FormState> _formKey = GlobalKey<FormState>();

      bool isAvailable = false;
      // File?  _picker ;
      final picker  = ImagePicker();
          Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        // _picker = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
}


  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(
      builder: (context,eventConsumer,_) {
        return Container(
          height: getScreenSize(context).height * 0.5,
          width: getScreenSize(context).width * 0.9,
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

        child: Form(
                    key: _formKey,
        
        
          child: Column(
          
        children: [
                  SizedBox(height: 20,),

          TextForm(labelText: "Event Title",
          controller: _title,
          
          ),
                  SizedBox(height: 20,),

             GestureDetector(
                          onTap: () async {
                            if (!isAvailable) {
                              DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(Duration(days: 365)));
                              if (date != null) {
                                _DateController.text =
                                    date.toString().substring(0, 10);
                              }
                            }
                          },

                          child: TextForm(
                              labelText: "Event Date",
                              enabled: false,
                              controller: _DateController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the Event date";
                                }
          
                                return null;
                              }),
                        ),
        SizedBox(height: 20,),
           TextForm(labelText: "Event Description",
          controller: _Description,
          
          ),
          
          
          //  GestureDetector(
        
          //   onTap: (){
          //     getImage();
          //   },
          //  child: _picker == null ? Container(
          //   height: getScreenSize(context).height * 0.1,
          //   width: getScreenSize(context).width * 0.9,
          
          //   child:TextForm(labelText: "Event Image",
          //   enabled: false,
          //   controller: _ImageController,)
          //  ) : Image.file(_picker!)
           
        
             
             
        
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
        
                Container(
                  width: getScreenSize(context).width * 0.27,
                  child: Mainbutton(
                  text: "Save", 
                  ontap: (){
                    if(_formKey.currentState!.validate()){
                      eventConsumer.event.name = _title.text;
                      eventConsumer.event.description = _Description.text;
                      eventConsumer.event.date = _DateController.text;

                      Provider.of<EventProvider>(context, listen: false).addEvent();
                    }
                  },)),
                Container(
                  width: getScreenSize(context).width * 0.27,
                  child: Mainbutton(
                  text: "Cancel", ontap: (){},
                  backgroundColor: Colors.grey[100],
                  textcolor: primaryColor,))
            
              ],
            ),
          )
        ]
          ),
        ),
        
        
        );
      }
    );
  }

}