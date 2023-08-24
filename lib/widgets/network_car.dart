import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/models/network_data.dart';

class NetworkCard extends StatelessWidget {
  final NetworkData data;
  const NetworkCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: mq.height * .004),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      color: Colors.white.withOpacity(0.3),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          data.title,
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        leading: Icon(
          data.icon.icon,
          color: Colors.white,
          size: data.icon.size ?? 40,
        ),
        subtitle: Text(data.subtitle,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
      ),
    );
  }
}
