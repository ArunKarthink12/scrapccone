import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

class ForgotOtpController extends GetxController {
  var forgotOtp = ''.obs;
  var forgotservice = ForgotService();
  RxBool isotpLoad = true.obs;
  Future forgotOtpController({mobileNumber}) async {
    try {
      var response = await forgotservice.forgotService(
          otp: forgotOtp.value.toString(), mobileNumber: mobileNumber);
      print('ccc');
      log(response.toString());

      if (response != null) {
        isotpLoad(false);

        Get.toNamed('/changeNewPassword');
      } else {
        isotpLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
