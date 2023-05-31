import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

class OtpService {
  //otp
  Future otpService({mobileNumber, otp}) async {
    try {
      var data = {"mobileNumber": mobileNumber ?? '', "OTP": otp ?? ''};
      log(data.toString());

      var response = await http.post(Uri.parse(Urls.otpverify), body: data);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return OtpModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        }
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
