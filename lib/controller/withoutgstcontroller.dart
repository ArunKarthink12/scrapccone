// WithOutGstOrderService
import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import '../model/withoutgstmodel.dart';
import '../service/withoutgstservice.dart';

class WithoutGstController extends GetxController {
  List<WithoutgstOrderModel> withoutgstorder = [];
  RxBool loadingindicator = true.obs;
  var withoutgstservice = WithOutGstOrderService();
  Future withoutGstControllerfunction({orderid}) async {
    try {
      loadingindicator(true);
      var clint =
          await withoutgstservice.withoutgstorderService(orderid: orderid);
      // log("withoutcontroller-->");
      // withoutgstorder.clear();
      if (clint != null) {
        withoutgstorder.clear();
        withoutgstorder.add(clint);

        loadingindicator(false);
      } else {
        loadingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
