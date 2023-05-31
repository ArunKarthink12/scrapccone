import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import '../model/homescreenSeparatemodel.dart';
import '../service/category_service.dart';
import '../service/homeservice.dart';

class HomeScreen_separate_Controller extends GetxController {
  RxBool homeLoad = true.obs;
  List<HomeModel> gethome = [];
  var homeservice = HomeService();

  Future homecontroller() async {
    log("TRY--1");
    try {
      log("TRY--2");

      var response = await homeservice.homescreenService();
      log("TRY--3");
      // homeLoad.value = true;

      // homeservice.homescreenService();
      if (response != null) {
        log("TRY--4");

        gethome.clear();
        gethome.add(response);
        homeLoad(false);
      } else {
        log("TRY--5");

        homeLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
