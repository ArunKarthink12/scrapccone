import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

class SignupInputFields extends StatefulWidget {
  const SignupInputFields({Key? key}) : super(key: key);

  @override
  State<SignupInputFields> createState() => _SignupInputFieldsState();
}

class _SignupInputFieldsState extends State<SignupInputFields> {
  RegisterController registerController = Get.put(RegisterController());
  LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isPinnewHidden = true;
  bool _isPinnewHidden1 = true;

  @override
  void initState() {
    //registerController.registerController();
    super.initState();
  }

  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  void _togglecnewPinView1() {
    setState(() {
      _isPinnewHidden1 = !_isPinnewHidden1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 3.0.hp),
            Container(
              color: Colors.white,
              height: 6.0.hp, width: 90.0.wp,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                controller: registerController.userName,
                style: forminputstyle,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: appcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: const Color(0xffC6C6C6).withOpacity(0.5),
                          width: 1),
                    ),
                    suffixIcon: Padding(
                        padding:
                            const EdgeInsets.only(top: 13, left: 5, bottom: 13),
                        child: Icon(
                          Icons.person,
                          size: MediaQuery.of(context).size.height * 0.025,
                          color: const Color(0xffC6C6C6),
                        )),
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'User Name',
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintStyle: formhintstyle,
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(height: 3.0.hp),
            Container(
              color: Colors.white,
              height: 6.0.hp, width: 90.0.wp,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                controller: registerController.emailID,
                style: forminputstyle,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: appcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: const Color(0xffC6C6C6).withOpacity(0.5),
                          width: 1),
                    ),
                    suffixIcon: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 5, bottom: 10),
                        child: Icon(
                          Icons.email,
                          size: MediaQuery.of(context).size.height * 0.025,
                          color: const Color(0xffC6C6C6),
                        )),
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'Email ID',
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintStyle: formhintstyle,
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(height: 3.0.hp),
            Container(
              color: Colors.white,
              height: 9.0.hp, width: 90.0.wp,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                controller: registerController.mobileNumber,
                maxLength: 10,
                style: forminputstyle,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: appcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: const Color(0xffC6C6C6).withOpacity(0.5),
                          width: 1),
                    ),
                    suffixIcon: Padding(
                        padding:
                            const EdgeInsets.only(top: 12, left: 5, bottom: 12),
                        child: Icon(
                          Icons.phone,
                          size: MediaQuery.of(context).size.height * 0.025,
                          color: const Color(0xffC6C6C6),
                        )),
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'Mobile Number',
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintStyle: formhintstyle,
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(height: 3.0.hp),
            Container(
              color: Colors.white,
              height: 6.0.hp, width: 90.0.wp,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                controller: registerController.password,
                style: forminputstyle,
                obscureText: _isPinnewHidden,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: appcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: const Color(0xffC6C6C6).withOpacity(0.5),
                          width: 1),
                    ),
                    suffixIcon: InkWell(
                      onTap: _togglecnewPinView,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 5, bottom: 15),
                        child: Icon(
                          _isPinnewHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: MediaQuery.of(context).size.height * 0.025,
                          color: const Color(0xffC6C6C6),
                        ),
                      ),
                    ),
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintStyle: formhintstyle,
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(height: 3.0.hp),
            Container(
              color: Colors.white,
              height: 6.0.hp, width: 90.0.wp,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                controller: registerController.confirmPassword,
                obscureText: _isPinnewHidden1,
                style: forminputstyle,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: appcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: const Color(0xffC6C6C6).withOpacity(0.5),
                          width: 1),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        _togglecnewPinView1();
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 5, bottom: 15),
                        child: Icon(
                          _isPinnewHidden1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: MediaQuery.of(context).size.height * 0.025,
                          color: const Color(0xffC6C6C6),
                        ),
                      ),
                    ),
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'Confirm Password',
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintStyle: formhintstyle,
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(height: 3.0.hp),
            ButtonIconButton(
              press: () async {
                if (formKey.currentState!.validate()) {
                  await registerController
                      .registerController(context: context)
                      .then((value) {
                    loginController.mobile.text = '';
                    loginController.password.text = '';
                  });
                }
                //Get.to(const OTPScreen());
              },
              bordercolor: appcolor1,
              text: 'SIGN UP',
            ),
            SizedBox(height: 3.0.hp),
          ],
        ),
      ),
    );
  }
}
