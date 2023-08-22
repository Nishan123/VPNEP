import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/apis/apis.dart';
import 'package:vpn_basic_project/models/ip_details.dart';
import 'package:vpn_basic_project/models/network_data.dart';
import 'package:vpn_basic_project/widgets/network_car.dart';

import '../main.dart';

class NetworkTestScreen extends StatelessWidget {
  const NetworkTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ipData = IPDetails.fromJson({}).obs;
    APIs.getIPDetails(ipData: ipData);
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Test Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ipData.value = IPDetails.fromJson({});
          APIs.getIPDetails(ipData: ipData);
        },
        child: Icon(Icons.refresh),
      ),
      body: Obx(
        () => ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: mq.width * .04,
                right: mq.width * .04,
                top: mq.height * .015,
                bottom: mq.height * .1),
            children: [
              //Ip card
              NetworkCard(
                data: NetworkData(
                  title: 'IP Address',
                  subtitle: ipData.value.query,
                  icon: Icon(
                    Icons.location_on_sharp,
                    color: Colors.blue,
                  ),
                ),
              ),
              //isp card
              NetworkCard(
                data: NetworkData(
                  title: 'Isp',
                  subtitle: ipData.value.isp,
                  icon: Icon(
                    Icons.router,
                    color: Colors.blue,
                  ),
                ),
              ),
              //location card
              NetworkCard(
                data: NetworkData(
                  title: 'Location',
                  subtitle: ipData.value.country.isEmpty
                      ? 'Not Availabe'
                      : '${ipData.value.city},${ipData.value.regionName},${ipData.value.country}',
                  icon: Icon(
                    Icons.navigation_sharp,
                    color: Colors.blue,
                  ),
                ),
              ),
              //pin card
              NetworkCard(
                data: NetworkData(
                  title: 'Pin-code',
                  subtitle: ipData.value.zip,
                  icon: Icon(
                    Icons.location_on_sharp,
                    color: Colors.blue,
                  ),
                ),
              ),
              //time card
              NetworkCard(
                data: NetworkData(
                  title: 'Time Zone',
                  subtitle: ipData.value.timezone,
                  icon: Icon(
                    Icons.timer,
                    color: Colors.blue,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
