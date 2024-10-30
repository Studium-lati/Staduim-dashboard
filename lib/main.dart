
import 'package:dashbord/helper/const.dart';
import 'package:dashbord/log_in_page.dart';
import 'package:dashbord/provider/auth_provider.dart';
import 'package:dashbord/provider/event_provider.dart';
import 'package:dashbord/provider/reservations_provider.dart';
import 'package:dashbord/widgets/clickables/bouttem_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context)=>ReservationsProvider()),
        ChangeNotifierProvider(create: (context)=>AuthenProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
        
          useMaterial3: true,
          
        
        ),
        home:  TabsScreen(),
      ),
    );
  }
}


 
  


