// AddmultiaddressService
// MultiaddressListService
import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/multiaddressmodel.dart';
import 'package:zero_scarp/model/multiadressadd.dart';
import 'package:zero_scarp/service/addmultiaddressservice.dart';

// import 'package:zero_scarp/service/materialquantity_gst_service.dart';
import 'package:zero_scarp/service/multiaddresslistservice.dart';

import '../view/order/delivaryaddres.dart';

// import '../model/materialTypeiwthGst_response.dart';

class AddMultiaddressController extends GetxController {
  RxBool addmultiadressloading = true.obs;
  List<MultiaddressaddedModel> addmultiaddressdatas = [];
  // List<MaterialTypeModel> get getmaterialtype => _materialtype;
  var clint = AddmultiaddressService();
  Future multiaddresscontrollerdatas(
      {address, city, street, state, pincode}) async {
    try {
      var response = await clint.addmultiaddressservicedata(
        address: address,
        city: city,
        pincode: pincode,
        state: state,
        street: street,
      );
      log(response.toString());
      if (response != null) {
        addmultiaddressdatas.add(response);
        log(addmultiaddressdatas.toString());
        // for (var i = 0; i < response; i++) {}
        addmultiadressloading(false);

        // Get.to(const DeliveryAddress());
      } else {
        addmultiadressloading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
