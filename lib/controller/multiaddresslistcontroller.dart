// MultiaddressListService
import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/multiaddressmodel.dart';

// import 'package:zero_scarp/service/materialquantity_gst_service.dart';
import 'package:zero_scarp/service/multiaddresslistservice.dart';

// import '../model/materialTypeiwthGst_response.dart';

class MultiaddressController extends GetxController {
  RxBool multiaddressloading = true.obs;
  List<MultilistaddressModel> multiaddressdatas = <MultilistaddressModel>[];

  // List<MaterialTypeModel> get getmaterialtype => _materialtype;
  var clint = MultiaddressListService();
  Future multiaddresscontrollerdatas() async {
    try {
      var response = await clint.multiaddresslistservicedata();
      multiaddressloading(true);
      if (response != null) {
        multiaddressdatas.clear();
        multiaddressdatas.add(response);

        multiaddressloading(false);
      } else {
        multiaddressloading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
