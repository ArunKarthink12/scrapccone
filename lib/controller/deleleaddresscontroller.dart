import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/deleteaddressmodel.dart';
import 'package:zero_scarp/service/deletemultiaddressservice.dart';
import 'package:zero_scarp/view/order/delivaryaddres.dart';

class DeleteaddressController extends GetxController {
  RxBool deleteaddressloading = true.obs;
  RxList<DeleteaddressModel> deleteaddresslist = <DeleteaddressModel>[].obs;
  var clint = DeleteaddressService();
  Future deleteaddresscontrollerdatas({address_id}) async {
    try {
      var response = await clint.deleteaddressservicedata(
        address_id: address_id,
      );
      // log(response.toString());
      if (response != null) {
        deleteaddresslist.clear();
        deleteaddresslist.add(response);
        // log(deleteaddresslist.toString());
        // Get.to(const DeliveryAddress());
        deleteaddressloading(false);
      } else {
        deleteaddressloading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
