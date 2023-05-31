import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:zero_scarp/allpackages.dart';

class CreatePasswordService {
  Future createPasswordService(
      {mobileNumber, password, confirmPassword}) async {
    log('enterrrrr');
    try {
      var data = {
        "mobileNumber": mobileNumber ?? '',
        "password": password ?? '',
        "confirmPassword": confirmPassword ?? ''
      };

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.createpassword), body: data);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          Fluttertoast.showToast(msg: jsonresponse['message']);
          return CreatePasswordModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          Get.back();
        }
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
