import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/constants/colors.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/helpers/pref.dart';
import 'package:vpn_basic_project/screens/countdown_timer.dart';
import 'package:vpn_basic_project/screens/network_test_screen.dart';
import 'package:vpn_basic_project/widgets/home_card.dart';
import 'package:vpn_basic_project/widgets/home_card_temp.dart';
import 'package:vpn_basic_project/widgets/vpn_button.dart';
import '../main.dart';
import '../models/vpn_status.dart';
import '../services/vpn_engine.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    ///Add listener to update vpn state
    VpnEngine.vpnStageSnapshot().listen((event) {
      _controller.vpnState.value = event;
    });
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      // bottomNavigationBar: ChangeLocationButton(),
      endDrawer: Drawer(
        child: ListView(
          children: [
            IconButton(
                onPressed: () {
                  Get.changeThemeMode(
                      Pref.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  Pref.isDarkMode = !Pref.isDarkMode;
                },
                icon: Icon(
                  Icons.dark_mode,
                  size: 30,
                )),
            IconButton(
                onPressed: () => Get.to(() => NetworkTestScreen()),
                icon: Icon(
                  Icons.info,
                  size: 30,
                ))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'VPNEP',
          style: TextStyle(fontFamily: 'Felixti'),
        ),
      ),
      body: Obx(
        () => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(height: mq.height * .015),
            //country card
            HomeCardTemp(
              title: _controller.vpn.value.countryLong.isEmpty
                  ? 'Country'
                  : _controller.vpn.value.countryLong,
              icon: CircleAvatar(
                radius: 19,
                backgroundColor: Colors.blue,
                child: _controller.vpn.value.countryLong.isEmpty
                    ? Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      )
                    : null,
                backgroundImage: _controller.vpn.value.countryLong.isEmpty
                    ? null
                    : AssetImage(
                        'assets/flags/${_controller.vpn.value.countryShort.toLowerCase()}.png'),
              ),
            ),
            SizedBox(height: mq.height * .04),
            VpnButton(onTap: () {
              _controller.connectToVpn();
            }),
            Text(_controller.getButtonText,style: TextStyle(color: Colors.white.withOpacity(0.6)),),
            SizedBox(height: mq.height * .01),
            //connection status label
            Text(
              _controller.vpnState.value == VpnEngine.vpnDisconnected
                  ? "Not Connected"
                  : _controller.vpnState.replaceAll('_', ' ').toUpperCase(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400,color: Colors.white),
            ),
            SizedBox(height: mq.height * .01),
            Obx(() => CountDownTimer(
                startTimer:
                    _controller.vpnState.value == VpnEngine.vpnConnected)),

            StreamBuilder<VpnStatus?>(
              initialData: VpnStatus(),
              stream: VpnEngine.vpnStatusSnapshot(),
              builder: (context, snapshot) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //ping card
                  HomeCard(
                      title: 'PING',
                      subtitle: _controller.vpn.value.countryLong.isEmpty
                          ? '999 ms'
                          : "${_controller.vpn.value.ping} ms",
                      iconImagePath: 'assets/icons/ping_icon.png'),
                  HomeCard(
                      title: 'DOWNLOAD',
                      subtitle: "${snapshot.data?.byteIn ?? "0 Kbps"}",
                      iconImagePath: 'assets/icons/download_icon.png'),
                  HomeCard(
                      title: 'UPLOAD',
                      subtitle: "${snapshot.data?.byteOut ?? "0 Kbps"}",
                      iconImagePath: 'assets/icons/Upload_icon.png'),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     HomeCard(
            //       title: _controller.vpn.value.countryLong.isEmpty
            //           ? 'Country'
            //           : _controller.vpn.value.countryLong,
            //       subtitle: 'Free',
            //       icon: CircleAvatar(
            //         radius: 28,
            //         backgroundColor: Colors.blue,
            //         child: _controller.vpn.value.countryLong.isEmpty
            //             ? Icon(
            //                 Icons.vpn_key,
            //                 color: Colors.white,
            //               )
            //             : null,
            //         backgroundImage: _controller.vpn.value.countryLong.isEmpty
            //             ? null
            //             : AssetImage(
            //                 'assets/flags/${_controller.vpn.value.countryShort.toLowerCase()}.png'),
            //       ),
            //     ),
            //     HomeCard(
            //       title: _controller.vpn.value.countryLong.isEmpty
            //           ? '100 ms'
            //           : "${_controller.vpn.value.ping} ms",
            //       subtitle: 'Ping',
            //       icon: CircleAvatar(
            //         radius: 28,
            //         child: Icon(
            //           Icons.equalizer_outlined,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: mq.height * .02),
            // StreamBuilder<VpnStatus?>(
            //   initialData: VpnStatus(),
            //   stream: VpnEngine.vpnStatusSnapshot(),
            //   builder: (context, snapshot) => Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       HomeCard(
            //         title: "${snapshot.data?.byteIn ?? "0 kbps"}",
            //         subtitle: 'Download',
            //         icon: CircleAvatar(
            //           radius: 28,
            //           child: Icon(
            //             Icons.download_outlined,
            //           ),
            //         ),
            //       ),
            //       HomeCard(
            //         title: "${snapshot.data?.byteOut ?? "0 kbps"}",
            //         subtitle: 'Upload',
            //         icon: CircleAvatar(
            //           radius: 28,
            //           child: Icon(
            //             Icons.upload_outlined,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }
}
