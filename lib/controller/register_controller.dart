import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

class RegisterController extends GetxController {
  var registerService = RegisterService();

  TextEditingController userName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController emailID = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RxBool isRegisterLoad = true.obs;

  List<RegisterModel> _register = [];
  //otp
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  //A function that validate user entered password
  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  Future registerController({number, context}) async {
    bool result = validatePassword(password.text);
    if (userName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter user name');
    } else if (mobileNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter mobile number');
    } else if (emailID.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter emailID');
    }

    // else if (password.text.isEmpty) {

    //   Fluttertoast.showToast(msg: 'Please Valid password');

    // }///changes
    else if (password.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter password");
    } else if (result == false) {
      Fluttertoast.showToast(
          msg:
              " Password should contain Capital, small letter & Number & Special");
    } else if (confirmPassword.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter confirmPassword');
    } else {
      isRegisterLoad(true);
      if (isRegisterLoad.value) {
        _loadingBar(context);
      }

      try {
        var response = await registerService.registerService(
            userName: userName.text,
            mobileNumber: mobileNumber.text,
            emailID: emailID.text,
            password: password.text,
            confirmPassword: confirmPassword.text);
        log('resss');
        log(response.toString());
        if (response != null) {
          Get.back();
          isRegisterLoad(false);
          Get.toNamed('/otp');
        } else {
          isRegisterLoad(false);
          Get.back();
        }
      } catch (e) {
        rethrow;
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
