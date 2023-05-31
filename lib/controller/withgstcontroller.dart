import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import '../model/gstordermodel.dart';
import '../service/withgstorder.dart';

class WithGstController extends GetxController {
  List<GstOrderModel> withgstorder = [];
  RxBool loadingindicator = true.obs;
  var gstservice = GstOrderService();
  Future withGstControllerfunction({orderid}) async {
    try {
      var clint = await gstservice.gstorderService(orderid: orderid);

      if (clint != null) {
        withgstorder.clear();
        withgstorder.add(clint);
        log("controller-->${withgstorder.toString()}");
        loadingindicator(false);
      } else {
        loadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
