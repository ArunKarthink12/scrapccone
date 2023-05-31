import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

import '../model/resend_otp_response.dart';

class ResendOtpService {
  Future resendOtpService({mobileNumber}) async {
    log('enterrrrr');
    try {
      var data = {"mobileNumber": mobileNumber ?? ''};
      log('dataaaaa');
      log(data.toString());

      var response = await http.post(Uri.parse(Urls.resendOtp), body: data);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return ResendOtpModel.fromJson(jsonresponse);
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
