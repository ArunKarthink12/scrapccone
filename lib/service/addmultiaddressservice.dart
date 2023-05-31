// addmultiaddress
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/multiaddressmodel.dart';
import 'package:zero_scarp/model/multiadressadd.dart';

// import '../model/materialTypeiwthGst_response.dart';

class AddmultiaddressService {
  Future addmultiaddressservicedata(
      {address, street, state, city, pincode}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    var data = {
      "address": address,
      "street": street,
      "state": state,
      "city": city,
      "pincode": pincode
    };
    try {
      var response = await http.post(Uri.parse(Urls.addmultiaddress),
          body: data, headers: {'Authorization': 'Bearer $token'});

      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return MultiaddressaddedModel.fromJson(jsonresponse);
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
