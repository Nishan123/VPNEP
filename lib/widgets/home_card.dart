import 'package:flutter/material.dart';
import 'package:vpn_basic_project/constants/colors.dart';

import '../main.dart';

class HomeCard extends StatelessWidget {
  final String title, subtitle;
  final String iconImagePath;
  const HomeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      margin: EdgeInsets.symmetric(
          horizontal: mq.width * .03, vertical: mq.height * .003),
      height: mq.height * .08,
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            iconImagePath,
            height: 43,
            width: 43,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Spacer(),
          Text(
            subtitle,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
