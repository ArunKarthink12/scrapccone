import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController mobile = TextEditingController();
  var forgotpasswordService = ForgotPasswordService();

  Future forgotPasswordController() async {
    try {
      var response = await forgotpasswordService.forgotPasswordService(
          mobile: mobile.text);
      log('mobile---${response}');
      if (response != null) {
        //Fluttertoast.showToast(msg: response.message.toString());
        Get.toNamed('/forgototp');
      } else {
        //Fluttertoast.showToast(msg: response.message.toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
