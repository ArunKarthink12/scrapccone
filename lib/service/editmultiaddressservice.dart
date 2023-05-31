// editmultiaddress
// deletmultiaddress
// addmultiaddress
// import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';
// import 'package:zero_scarp/model/deleteaddressmodel.dart';
import 'package:zero_scarp/model/editaddresmodel.dart';

class EditaddressService {
  Future editaddressservicedata(
      {address_id, address, city, state, pincode, street}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    var data = {
      "address_id": address_id,
      "address": address,
      "street": street,
      "state": state,
      "city": city,
      "pincode": pincode
    };
    try {
      var response = await http.post(Uri.parse(Urls.editmultiaddress),
          body: data, headers: {'Authorization': 'Bearer $token'});

      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return EditaddressModel.fromJson(jsonresponse);
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
