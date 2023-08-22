import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_basic_project/controllers/location_controller.dart';
import 'package:vpn_basic_project/widgets/vpn_card.dart';

import '../main.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});
  final _controller = LocationController();
  @override
  Widget build(BuildContext context) {
    if (_controller.vpnlist.isEmpty) _controller.getVpnData();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('${_controller.vpnlist.length} Locations Available'),
        ),
        //refresh button
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              _controller.getVpnData();
            },
            child: Icon(Icons.refresh),
          ),
        ),
        body: _controller.isLoading.value
            ? _loadingWidget()
            : _controller.vpnlist.isEmpty
                ? _noVPNFound()
                : _vpnData(),
      ),
    );
  }

  _vpnData() => ListView.builder(
      padding: EdgeInsets.only(top: mq.height * .015, bottom: mq.height * .1),
      itemCount: _controller.vpnlist.length,
      itemBuilder: (ctx, i) => VpnCard(vpn: _controller.vpnlist[i]));

  _loadingWidget() => Center(
      child: LottieBuilder.asset('assets/lottie/loading animation.json'));

  _noVPNFound() => Center(
        child: Text(
          "No VPNs Found",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      );
}
