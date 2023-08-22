import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:vpn_basic_project/screens/home_screen.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 5000), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      //for navagating to home screen
      Get.off(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: mq.width * .3,
            top: mq.height * .4,
            width: mq.width * .4,
            child: Image.asset('assets/images/app icon compress.png'),
          ),
          Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: Text(
              'VpNep',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).lightText,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5),
            ),
          )
        ],
      ),
    );
  }
}
