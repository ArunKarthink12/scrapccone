import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/history_Model.dart';

import '../service/history_service.dart';

class History_Controller extends GetxController {
  RxList<HistoryModel> historycontrollerList = <HistoryModel>[].obs;
  RxBool loodingindicator = true.obs;
  var history = HistoryService();

  Future<bool> historycontroller() async {
    log("Printy");
    try {
      loodingindicator(true);
      var response = await history.historydatafetch();

      historycontrollerList.clear();
      if (response != null) {
        historycontrollerList.clear();
        historycontrollerList.add(response);

        loodingindicator(false);
        return true;
      } else {
        loodingindicator(false);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
