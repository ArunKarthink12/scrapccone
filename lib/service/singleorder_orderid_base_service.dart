// singleorderusingid
// import 'dart:developer';

import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';
// import 'package:zero_scarp/model/multiaddressmodel.dart';
// import 'package:zero_scarp/model/selectaddressmodel.dart';

import '../model/singleorderidbasedmodel.dart';

// import '../model/materialTypeiwthGst_response.dart';

class SingleOrder_Orderid_baseService {
  Future singleorderidbaseservicedata({order_id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    var data = {
      "order_id": order_id.toString(),
    };
    log(token!);
    try {
      log("check$order_id");
      var response = await http.post(
        Uri.parse(Urls.singleorderusingid),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data,
      );

      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        log("check-->$order_id");
        if (jsonresponse['status'] == 'success') {
          log("check$order_id");
          // log(jsonresponse);
          return SingleorderdataModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        }
      } else {
        return null;
      }
    } catch (e) {
      // rethrow
      log("service->$e");
    }
  }
}
