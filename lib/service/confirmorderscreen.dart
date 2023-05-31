import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

class ConfirmOrderService {
  Future confirmOrderSV({
    orderId,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    try {
      var data = {
        "order_id": orderId ?? '',
      };
      log('data-----${data.toString()}');
      var response = await http.post(Uri.parse(Urls.confirmOrder),
          headers: {'Authorization': 'Bearer $token'}, body: data);
      log('responseeeefilldata-------${response.body.toString()}');

      var jsonresponse = jsonDecode(response.body);
      // log('jsonrespose----${jsonresponse}');

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          // return FillDetailsModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          Get.back();
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
