import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/helpers/my_dialogs.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/services/vpn_engine.dart';

import '../helpers/pref.dart';
import '../models/vpn.dart';

class VpnCard extends StatelessWidget {
  final Vpn vpn;
  const VpnCard({super.key, required this.vpn});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: Card(
        color: Colors.white.withOpacity(0.3),
        margin: EdgeInsets.symmetric(vertical: mq.height * .002),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        child: InkWell(
          onTap: () {
            controller.vpn.value = vpn;
            Pref.vpn = vpn;
            Get.back();
            MyDialogs.success(msg: "Connection to Server");
            if (controller.vpnState.value == VpnEngine.vpnConnected) {
              VpnEngine.stopVpn();
              Future.delayed(
                  Duration(seconds: 2), () => controller.connectToVpn());
            } else {
              controller.connectToVpn();
            }
          },
          child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(
                vpn.countryLong,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              leading: Image.asset(
                'assets/flags/${vpn.countryShort.toLowerCase()}.png',
                height: 40,
                width: mq.width * .15,
                fit: BoxFit.cover,
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.speed,color: Colors.white54,),
                  SizedBox(width: 5),
                  Text(_formatBytes(vpn.speed, 2),style: TextStyle(color: Colors.white54),),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.people,color: Colors.white54,),
                  SizedBox(width: 5),
                  Text(vpn.numVpnSessions.toString(),style: TextStyle(color: Colors.white54),),
                ],
              )),
        ),
      ),
    );
  }

  String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ['Bps', 'Kbps', 'Mbps', 'Gbps', 'Tbps'];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
