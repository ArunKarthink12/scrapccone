import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zero_scarp/allpackages.dart';

import '../model/otp_response.dart';

class RegisterService {
  Future registerService(
      {userName, mobileNumber, emailID, password, confirmPassword}) async {
    try {
      var data = {
        "userName": userName,
        "mobileNumber": mobileNumber,
        "email_id": emailID,
        "password": password,
        "confirmPassword": confirmPassword
      };
      log(data.toString());
      var dataEncode = jsonEncode(data);
      var response = await http.post(Uri.parse(Urls.register), body: data);

      var jsonresponse = jsonDecode(response.body);
      log("signup_out${response.body.toString()}");

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          Fluttertoast.showToast(msg: jsonresponse['message']);
          return RegisterModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        }
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
