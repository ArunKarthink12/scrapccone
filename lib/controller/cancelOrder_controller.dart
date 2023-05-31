import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import '../model/cancelCompleted.dart';
import '../service/cancelOrder_service.dart';

class CancelOrder_Controller extends GetxController {
  var cancelOrdercontroller = <CancelOrderModel>[].obs;
  // RxBool loadingindicator = true.obs;
  // CancelOrderservicedatafetch
  Future datafetchfromCancelorderService({orderID, Reason, Comments}) async {
    // log("message::::${cancelOrdercontroller[0].message.toString()}");
    var clint = await Cancel_Order_Service.CancelOrderservicedatafetch(
        orderID: orderID, reason: Reason, comments: Comments);
    // log("lllllll");
    // log(cancelOrdercontroller[0].status.toString());
    if (clint != null) {
      cancelOrdercontroller.clear();
      log("sssssss");
      cancelOrdercontroller.add(clint);

      Fluttertoast.showToast(msg: cancelOrdercontroller[0].message.toString());
      // if (cancelOrdercontroller != null) {
      //   // loadingindicator.value = false;

      // } else {
      //   loadingindicator.value = true;
      // }
      // return
    } else {
      // log("Error");
      throw Exception(clint);
    }
  }
}
