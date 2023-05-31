// notificationservicedatafetch
import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/history_Model.dart';
import 'package:zero_scarp/model/notification_Model.dart';

import '../service/history_service.dart';
import '../service/notification_Service.dart';

class Notification_Controller extends GetxController {
  RxList<NotificationModel> notificationcontrollerList =
      <NotificationModel>[].obs;
  RxBool loodingindicator = true.obs;
  var notification = Notification_Service();

  Future fetchdatafromhistoryservice() async {
    try {
      loodingindicator(true);
      var homeclint = await notification.notificationservicedatafetch();
      // log("control$homeclint");
      notificationcontrollerList.clear();
      if (homeclint != null) {
        notificationcontrollerList.clear();

        notificationcontrollerList.add(homeclint);
        loodingindicator(false);
      } else {
        loodingindicator(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
