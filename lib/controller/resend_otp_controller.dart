import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/service/resend_otp_service.dart';

import '../model/resend_otp_response.dart';

class ResendOtpController extends GetxController {
  RxBool loginLoading = true.obs;
  List<ResendOtpModel> resendOtpmodel = [];
  List<ResendOtpModel> get getresendmodel => resendOtpmodel;
  RxBool resendotpLoad = true.obs;
  var resendotpService = ResendOtpService();
  Future resendOtpController({mobileNumber, context}) async {
    loginLoading(true);
    if (loginLoading.value) {
      _loadingBar(context);
    }
    try {
      var response =
          await resendotpService.resendOtpService(mobileNumber: mobileNumber);
      if (response != null) {
        // Get.toNamed('/forgototp');

        resendotpLoad(false);
        Fluttertoast.showToast(msg: response.message);
        Get.back();
      } else {
        resendotpLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  void _loadingBar(BuildContext ctx) {
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext context) {
          return const Center(
            child: Loader(),
          );
        });
  }
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          // decoration: BoxDecoration(color: Colors.amber),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(child: const CircularProgressIndicator())),
    );
  }
}
