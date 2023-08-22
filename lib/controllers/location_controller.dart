import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vpn_basic_project/apis/apis.dart';
import 'package:vpn_basic_project/helpers/pref.dart';
import '../models/vpn.dart';

class LocationController extends GetxController {
  List<Vpn> vpnlist = Pref.vpnList;

  final RxBool isLoading = false.obs;

  Future<void> getVpnData() async {
    isLoading.value = true;
    vpnlist.clear();
    vpnlist = await APIs.getVPNServers();
    isLoading.value = false;
  }
}
