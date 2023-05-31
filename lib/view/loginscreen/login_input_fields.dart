import 'package:zero_scarp/allpackages.dart';

class LoginInputFields extends StatefulWidget {
  const LoginInputFields({Key? key}) : super(key: key);

  @override
  State<LoginInputFields> createState() => _LoginInputFieldsState();
}

class _LoginInputFieldsState extends State<LoginInputFields> {
  LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isPinnewHidden = true;

  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 7.0.hp, width: 90.0.wp,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                controller: loginController.mobile,
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
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'Mobile number',
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
                controller: loginController.password,
                obscureText: _isPinnewHidden,
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
                        _togglecnewPinView();
                      },
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
            SizedBox(height: 2.0.hp),
            InkWell(
              onTap: () {
                Get.to(const ForgotPasswordScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: appcolor,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 3.0.hp),
            ButtonIconButton(
              press: () {
                if (formKey.currentState!.validate()) {
                  loginController.loginController(context: context);

                  //Get.to(const HomePage());
                }
              },
              bordercolor: appcolor1,
              text: 'LOG IN',
            ),
          ],
        ),
      ),
    );
  }
}
