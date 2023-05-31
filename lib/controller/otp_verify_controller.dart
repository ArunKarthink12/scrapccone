import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/service/otp_service.dart';

class OtpVerifyController extends GetxController {
  var otpService = OtpService();
  TextEditingController otptext = TextEditingController();
  TextEditingController forgotOtptext = TextEditingController();
  var otp = ''.obs;
  RxBool isotpLoad = true.obs;
  RxBool isforgototpLoad = true.obs;
  Future otpVerifyController({mobilenumber}) async {
    try {
      var response = await otpService.otpService(
          otp: otp.value, mobileNumber: mobilenumber);
      print(response);
      if (response != null) {
        Get.toNamed('/login');
      } else {
        isotpLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  //forgot otp
  Future forgotOtpVerifyController({mobilenumber}) async {
    try {
      var response = await otpService.otpService(
          otp: forgotOtptext.text, mobileNumber: mobilenumber);
      print(response);
      if (response != null) {
        Get.toNamed('/changeNewPassword');
      } else {
        isforgototpLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
