import 'dart:developer';

import '../allpackages.dart';
import '../model/cancelCompleted.dart';
import 'package:http/http.dart' as http;

class Cancel_Order_Service {
  static Future<CancelOrderModel?> CancelOrderservicedatafetch({
    orderID,
    reason,
    comments,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse(Urls.cancelOrderUrl);

    ///data recived by previous screen categoryId
    var referenceid = {
      "order_id": orderID,
      "reason": reason,
      "comment": comments
    };

    ///getString token in local variable
    var token = sharedPreferences.getString(Constants.authToken);

    ///Responce
    var response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: referenceid);
    log("service responce -->${response.body}");
    var jonresponce = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Fluttertoast.showToast(msg: response.body);

      log("Service condition responce-->${response.body}");

      ///insert responce by modelclass
      return CancelOrderModel.fromJson(jonresponce);
    } else {
      log("Error");
    }
  }
}
