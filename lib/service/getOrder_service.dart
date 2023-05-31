import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zero_scarp/allpackages.dart';
import '../model/getOrder.dart';

class GetOrder_Service {
  // ignore: non_constant_identifier_names
  Future fetchdatafrom_GetorderModel() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    var url = Uri.parse(Urls.getorder);
    try {
      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      log("body--->${response.body}");
      var jsonresponse = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (jsonresponse['status'] == 'success') {
          log('kkkkk');

          return OrderModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
