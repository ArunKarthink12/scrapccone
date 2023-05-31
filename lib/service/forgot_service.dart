import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

class ForgotService {
  Future forgotService({mobileNumber, otp}) async {
    log('enterrrrringgg');
    try {
      var data = {"mobileNumber": mobileNumber ?? '', "OTP": otp ?? ''};
      log('-------------');
      log(data.toString());

      var response = await http.post(Uri.parse(Urls.forgototp), body: data);
      log(response.body);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return ForgetOtpModel.fromJson(jsonresponse);
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
