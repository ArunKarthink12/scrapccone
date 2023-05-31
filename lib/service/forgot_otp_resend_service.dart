import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

class ForgotResendOtpService {
  Future forgotResendOtpService({mobileNumber}) async {
    log('enterrrrr');
    try {
      var data = {"mobileNumber": mobileNumber ?? ''};
      log('dataaaaa');
      log(data.toString());

      var response =
          await http.post(Uri.parse(Urls.forgotOtpresend), body: data);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return ForgotOtpResendModel.fromJson(jsonresponse);
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
