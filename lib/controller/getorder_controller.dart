import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/getOrder.dart';

import '../service/getOrder_service.dart';

class Get_Order_Controller extends GetxController {
  RxList<OrderModel> getorderContorller = <OrderModel>[].obs;
  RxBool loadingindicator = true.obs;
  var orderid;
  TextEditingController additionalComment = TextEditingController();
  var additionalcomment_Text;
  var getservice = GetOrder_Service();

  Future<bool> datafetchfromgetorderService() async {
    try {
      var clint = await getservice.fetchdatafrom_GetorderModel();
      if (clint != null) {
        getorderContorller.clear();
        getorderContorller.add(clint);
        // var json = jsonEncode(getorderContorller);
        // log(json);
        log('controllerbody-->$getorderContorller');
        loadingindicator(false);
        return true;
      } else {
        loadingindicator(false);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
