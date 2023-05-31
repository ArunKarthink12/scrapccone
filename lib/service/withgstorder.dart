import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

import '../model/gstordermodel.dart';

class GstOrderService {
  Future gstorderService({orderid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(Urls.ordersGst));
    request.body = json.encode({"order_id": orderid.toString(), "gst": "12"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var jsonresponse = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      if (jsonresponse['status'] == 'success') {
        // log("sdsdsdsd${await response.stream.bytesToString()}");
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        return GstOrderModel.fromJson(jsonresponse);
      } else {
        return null;
      }
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var token = sharedPreferences.getString(Constants.authToken);
    // try {
    //   var data = {
    //     "gstNumber": 15,
    //     "order_id": 5893.toString(),
    //   };
    //   log("data--->$data");
    //   var decode = jsonEncode(data);

    //   var response = await http.post(
    //       Uri.parse(
    //           "https://propluslogics.in/zero_scrap_api/api/list_orders_gst"),
    //       headers: {
    //         "Content-type": "multipart/form-data",
    //         'content-type': 'application/json',
    //         'Authorization': 'Bearer $token'
    //       },
    //       body: decode);

    //   log('responseeeefilldata-------${response.body.toString()}');

    //   var jsonresponse = jsonDecode(response.body);
    //   log('jsonrespose----$jsonresponse');

    //   if (response.statusCode == 200) {
    //     if (jsonresponse['status'] == 'success') {
    //       Fluttertoast.showToast(msg: jsonresponse['message'].toString());
    //       return GstOrderModel.fromJson(jsonresponse);
    //     } else {
    //       Fluttertoast.showToast(msg: jsonresponse['message'].toString());
    //     }
    //   } else {
    //     return null;
    //   }
    // }
    // catch (e) {
    //   rethrow;
    // }
  }
}
