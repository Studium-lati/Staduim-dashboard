import 'dart:async';

import 'package:dashbord/helper/const.dart';
import 'package:dashbord/main.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ScreenRouter()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo_remove.png',
          height: getScreenSize(context).height * 0.5,
          width: getScreenSize(context).width * 0.5,
        ),
      ),
    );
  }
}
