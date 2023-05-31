import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import 'package:zero_scarp/service/materialquantity_gst_service.dart';

import '../model/materialTypeiwthGst_response.dart';

class MaterialQuantityController extends GetxController {
  RxBool materialtypeLoad = true.obs;
  List<MaterialTypeModel> getmaterialtype = [];
  // List<MaterialTypeModel> get getmaterialtype => _materialtype;
  var materialquantity = MaterialQuantityService();
  Future materialQuantityController({materialId, quantity}) async {
    try {
      var response = await materialquantity.materialQuantityservice(
          materialId: materialId, quantity: quantity);
      log(response.toString());
      if (response != null) {
        getmaterialtype.add(response);
        log(getmaterialtype.toString());
        // for (var i = 0; i < response; i++) {}
        materialtypeLoad(false);

        // Get.to(const DetailsScreen());
      } else {
        materialtypeLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
