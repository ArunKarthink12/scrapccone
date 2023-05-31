// deletmultiaddress
// addmultiaddress
// import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/deleteaddressmodel.dart';

class DeleteaddressService {
  Future deleteaddressservicedata({address_id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    var data = {
      "address_id": address_id,
    };
    try {
      var response = await http.post(Uri.parse(Urls.deletmultiaddress),
          body: data, headers: {'Authorization': 'Bearer $token'});

      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return DeleteaddressModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
