import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

import '../model/withoutgstmodel.dart';

class WithOutGstOrderService {
  Future withoutgstorderService({orderid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    try {
      var data = {
        "order_id": orderid.toString(),
      };
      var response = await http.post(Uri.parse(Urls.withoutgstfetch),
          headers: {'Authorization': 'Bearer $token'}, body: data);

      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return WithoutgstOrderModel.fromJson(jsonresponse);
        } else {
          // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
