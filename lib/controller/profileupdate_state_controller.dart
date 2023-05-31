import 'dart:developer';
import 'dart:io';

import 'package:zero_scarp/allpackages.dart';

import '../model/profileUpdate_city_response.dart';
import '../model/profileupdate_state_response.dart';

import '../service/proileUpdate_state_service.dart';

class ProfileUpdateStateController extends GetxController {
  List<ProfileUpdatStateModel> _profileupdatestate = [];
  List<ProfileUpdatStateModel> get getprofileUpdatestate => _profileupdatestate;
  List<ProfileUpdatCityModel> _profileupdateCity = [];
  List<ProfileUpdatCityModel> get getprofileUpdateCity => _profileupdateCity;
  var profilupdatestate = ProfileUpdteStateService();
  var state;
  var city;
  // File profileimage = File("");
  File pd = File("");

  RxBool isStateLoading = true.obs;
  RxBool isCityLoading = true.obs;

  Future getCity() async {
    isCityLoading(true);
    try {
      var response = await profilupdatestate.profileUpdtecityService();
      log(response.toString());
      if (response != null) {
        _profileupdateCity.add(response);

        isCityLoading(false);
      } else {
        isCityLoading(false);
        //Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
