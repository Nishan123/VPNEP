import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:vpn_basic_project/constants/colors.dart';
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
      backgroundColor: scaffoldBackgroundColor,
      body: Stack(
        children: [
          Center(
              child: Text(
            "VPNEP",
            style: TextStyle(
                fontFamily: 'Felixti', color: Colors.white, fontSize: 35),
          )),
          Positioned(
            bottom: mq.height * .16,
            width: mq.width,
            child: Text(
              'Powered by',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
          ),
           Positioned(
            bottom: mq.height * .13,
            width: mq.width,
            child: Text(
              '2K Soft',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),
            ),
          )
        ],
      ),
    );
  }
}
