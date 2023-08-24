import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/apis/apis.dart';
import 'package:vpn_basic_project/constants/colors.dart';
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
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Network Test'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          
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
                ),
              ),
            ),
            //isp card
            NetworkCard(
              data: NetworkData(
                title: 'ISP',
                subtitle: ipData.value.isp,
                icon: Icon(
                  Icons.router,
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
                ),
              ),
            ),
            SizedBox(height: mq.height * .04),
            //refresh button
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                ipData.value = IPDetails.fromJson({});
                APIs.getIPDetails(ipData: ipData);
              },
              child: Container(
                height: mq.height * .06,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 68, 0, 255),
                        Color.fromARGB(137, 68, 0, 255),
                        Color.fromARGB(216, 68, 0, 255),
                        Color.fromARGB(159, 145, 105, 255)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0, 0.2, 0.5, 0.8]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Refresh",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
       
        
          ],
        ),
      ),
    );
  }
}
