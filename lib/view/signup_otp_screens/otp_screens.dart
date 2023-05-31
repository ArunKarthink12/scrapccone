import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/resend_otp_controller.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  AssetImage? images;
  ResendOtpController resendOtpController = Get.put(ResendOtpController());
  RegisterController registerController = Get.put(RegisterController());
  bool showCircular = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    images = const AssetImage(
      "assets/img/enterOTP.gif",
    );
  }

  @override
  void dispose() {
    //  print('${widget.asset} dispose');
    images!.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appcolor,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              color: appcolor,
            ),
            DraggableScrollableSheet(
              builder: (BuildContext buildContext,
                  ScrollController scrollController) {
                return Material(
                    elevation: 5,
                    shadowColor: Colors.black,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          ),
                          color: Colors.white),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            SizedBox(height: 4.0.hp),
                            Container(
                              height: 40.0.hp,
                              width: 80.0.wp,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: images!)),
                            ),
                            Text('Enter your Verification Code',
                                style: toptitleStyle),
                            SizedBox(height: 00.20.hp),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Flexible(
                            //       child: Text(
                            //         'We sent a verification code to +91 9876543234',
                            //         style: subtitleStyle,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: 4.0.hp),
                            const OtpField(),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           const LoginScreen()),
                                // );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don’t receive code ? ',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 9.0.sp,
                                            color: const Color(0xff373737),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // showCircular = true;
                                      print('clickkkk');

                                      resendOtpController.resendOtpController(
                                          mobileNumber: registerController
                                              .mobileNumber.text
                                              .toString(),
                                          context: context);
                                    },
                                    child: Text(
                                      'Resend',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 11.0.sp,
                                              color: appcolor,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5.0.hp),
                          ],
                        ),
                      ),
                    ));
              },
              // minChildSize<=initialChildSize
              // initial size of the sheet when app is opened.
              // default value 0.5
              initialChildSize: .9, //will take 30% of screen space
              //minimum size to which sheet can be dropped down.
              // default value .25
              minChildSize: .85,

              //max size to which  sheet can be dragged up
              //default value 1.0
              maxChildSize: 0.95,
            ),
          ],
        ));
  }
}
