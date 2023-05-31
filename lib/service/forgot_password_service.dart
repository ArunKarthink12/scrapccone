import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

class ForgotPasswordService {
  Future forgotPasswordService({mobile}) async {
    log('enterrrrr');
    try {
      var data = {"mobile": mobile};
      log('dataa');
      log('mobieee--${data.toString()}');

      var response =
          await http.post(Uri.parse(Urls.forgotPassword), body: data);

      var jsonresponse = jsonDecode(response.body);
      log('mobile----${response.body.toString()}');
      log('toast------');

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return ForgetOtpModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return null;
        }
      } else {
        // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
