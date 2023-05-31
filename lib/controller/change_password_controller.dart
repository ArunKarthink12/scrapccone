import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/service/change_password_service.dart';

class ChangePaswordController extends GetxController {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RxBool createpasswordLoad = true.obs;
  var changePassword = ChangePasswordService();
  Future changePasswordController({context}) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    var mobileNumber = _sharedPreferences.getString(Constants.phoneno);
    if (oldPassword.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter old password");
    } else if (oldPassword.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter create password");
    } else if (oldPassword.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter confirm password");
    } else {
      createpasswordLoad(true);
      if (createpasswordLoad.value) {
        _loadingBar(context);
      }

      try {
        var response = await changePassword.changePasswordService(
            oldPassword: oldPassword.text,
            newPassword: newPassword.text,
            confirmPassword: confirmPassword.text,
            mobileNumber: mobileNumber);
        log('responseeeee------------');
        log(response.toString());

        if (response != null) {
          Get.back();
          print('responseeee');
          createpasswordLoad(false);
          Fluttertoast.showToast(msg: response.message.toString());
          Get.back();
        } else {
          //Fluttertoast.showToast(msg: response.message.toString());
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
