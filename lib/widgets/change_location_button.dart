import 'package:flutter/material.dart';
import 'package:vpn_basic_project/screens/location_screen.dart';
import '../main.dart';

class ChangeLocationButton extends StatelessWidget {
  const ChangeLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: mq.width * .03),
          height: mq.height * .08,
          color: Theme.of(context).bottomNav,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Text(
                "Change Location",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LocationScreen()));
                },
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 37,
                ),
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
