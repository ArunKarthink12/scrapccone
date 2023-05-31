import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

class CreatePaswordController extends GetxController {
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  RxBool createpasswordLoad = true.obs;
  var createPassword = CreatePasswordService();
  Future createPasswordController({mobileNumber, context}) async {
    if (newpassword.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter newpassword');
    } else if (confirmpassword.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter confirmpassword');
    } else {
      if (createpasswordLoad.value) {
        _loadingBar(context);
      }

      try {
        var response = await createPassword.createPasswordService(
            mobileNumber: mobileNumber,
            password: newpassword.text,
            confirmPassword: confirmpassword.text);
        log('*******');

        if (response != null) {
          Get.back();
          createpasswordLoad(false);
          Fluttertoast.showToast(msg: response.message.toString());
          Get.toNamed('/login');
          createpasswordLoad(false);
        } else {
          Fluttertoast.showToast(msg: response.message.toString());
          createpasswordLoad(false);
        }
      } catch (e) {
        rethrow;
      }
    }
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
