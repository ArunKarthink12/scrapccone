// SingleOrder_Orderid_baseService
import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/singleorderidbasedmodel.dart';
// import 'package:zero_scarp/model/multiaddressmodel.dart';
// import 'package:zero_scarp/model/selectaddressmodel.dart';

// import 'package:zero_scarp/service/materialquantity_gst_service.dart';
// import 'package:zero_scarp/service/multiaddresslistservice.dart';
// import 'package:zero_scarp/service/selectaddressservice.dart';
import 'package:zero_scarp/service/singleorder_orderid_base_service.dart';

// import '../model/materialTypeiwthGst_response.dart';

class SingleorderidbasedController extends GetxController {
  RxBool singleorderloading = true.obs;
  List<SingleorderdataModel> singleorderdatas = [];

  // List<MaterialTypeModel> get getmaterialtype => _materialtype;
  var clint = SingleOrder_Orderid_baseService();
  Future singleorderidbasedcontrollerdatas({order_id}) async {
    try {
      // singleorderloading(true);
      var response =
          await clint.singleorderidbaseservicedata(order_id: order_id);

      if (response != null) {
        singleorderdatas.clear();
        singleorderdatas.add(response);
        // log(response);

        singleorderloading(false);
      } else {
        singleorderloading(false);
      }
    } catch (e) {
      // rethrow;
      log('controll$e');
    }
  }
}
