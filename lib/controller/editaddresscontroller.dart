// EditaddressService
import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
// import 'package:zero_scarp/model/deleteaddressmodel.dart';
import 'package:zero_scarp/model/editaddresmodel.dart';
// import 'package:zero_scarp/service/deletemultiaddressservice.dart';
import 'package:zero_scarp/service/editmultiaddressservice.dart';
import 'package:zero_scarp/view/order/delivaryaddres.dart';

class EditaddressController extends GetxController {
  RxBool editaddressloading = true.obs;
  RxList<EditaddressModel> editaddresslist = <EditaddressModel>[].obs;
  var clint = EditaddressService();
  Future editaddresscontrollerdatas(
      {address_id, address, pincode, state, city, street}) async {
    try {
      var response = await clint.editaddressservicedata(
        address: address,
        city: city,
        pincode: pincode,
        state: state,
        street: street,
        address_id: address_id,
      );
      log(response.toString());
      if (response != null) {
        editaddresslist.clear();
        editaddresslist.add(response);
        log(editaddresslist.toString());
        if (address == '' ||
            city == '' ||
            pincode == '' ||
            street == '' ||
            state == '') {
          Fluttertoast.showToast(msg: "Fill All Fields");
        }
        // {

        //   // Get.back();
        //   // Get.to(const DeliveryAddress());
        // }
        editaddressloading(false);
      } else {
        editaddressloading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
