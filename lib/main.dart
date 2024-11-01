import 'package:dashbord/helper/const.dart';
import 'package:dashbord/pages/auth_page/log_in_page.dart';
import 'package:dashbord/provider/auth_provider.dart';
import 'package:dashbord/provider/event_provider.dart';
import 'package:dashbord/provider/reservations_provider.dart';
import 'package:dashbord/pages/auth_page/splash_page.dart';
import 'package:dashbord/provider/staduim_provider.dart';
import 'package:dashbord/widgets/clickables/bouttem_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        ChangeNotifierProvider(create: (context) => ReservationsProvider()),
        ChangeNotifierProvider(
            create: (context) => AuthenProvider()..initializeAuthProvider()),
        ChangeNotifierProvider(
            create: (context) => StaduimProvider()..getStaduim()),
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          primaryColor: primaryColor,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: const SplashPage(),
      ),
    );
  }
}

class ScreenRouter extends StatefulWidget {
  const ScreenRouter({super.key});

  @override
  State<ScreenRouter> createState() => _ScreenRouterState();
}

class _ScreenRouterState extends State<ScreenRouter> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthenProvider>(context, listen: false)
        .initializeAuthProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(builder: (context, authConsumer, child) {
      return authConsumer.authenticated
          ? const TabsScreen()
          : const LogInPage();
    });
  }
}
