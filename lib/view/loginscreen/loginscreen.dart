import 'package:zero_scarp/allpackages.dart';

import '../livelocation/area.dart';
import '../livelocation/livelocation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  AssetImage? images;
  // String? token;

  @override
  void initState() {
    // loginController.loginController();
    super.initState();
    images = const AssetImage(
      "assets/img/register.gif",
    );
  }

  @override
  void dispose() {
    print('loginnnnn------------${loginController.mobile.text.toString()}');
    //  print('${widget.asset} dispose');
    images!.evict();
    super.dispose();
  }

  back() {
    return Get.to(
      const CityScreen()
      // AreasScreen()
      );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => back(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: appcolor,
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                color: appcolor,
              ),
              SizedBox(
                child: DraggableScrollableSheet(
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
                                Container(
                                  height: 40.0.hp,
                                  width: 80.0.wp,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: images!)),
                                ),
                                //  SizedBox(height: 4.00.hp),
                                SizedBox(
                                    child: Text('Welcome Back',
                                        style: toptitleStyle)),
                                SizedBox(height: 00.20.hp),
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Let’s login for explore continues',
                                          style: subtitleStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3.0.hp),
                                const LoginInputFields(),
                                // SizedBox(height: 3.0.hp),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Container(
                                //       width: 30.0.wp,
                                //       height: 00.20.hp,
                                //       color: const Color(0xffE8E8E8),
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: 8.0, right: 8),
                                //       child: Text(
                                //         'Start quickly with',
                                //         style: GoogleFonts.poppins(
                                //             textStyle: TextStyle(
                                //                 fontSize: 9.0.sp,
                                //                 color: const Color(0xffB1BDC9),
                                //                 fontWeight: FontWeight.w500)),
                                //       ),
                                //     ),
                                //     Container(
                                //       width: 30.0.wp,
                                //       height: 0.20.hp,
                                //       color: const Color(0xffE8E8E8),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 3.0.hp),
                                // const SocialLogin(),
                                // SizedBox(height: 5.0.hp),
                                // Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupScreen()),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 30.0.sp),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Don’t have an account ? ',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 10.0.sp,
                                                  color:
                                                      const Color(0xff373737),
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Text(
                                          'Create Now',
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
                                SizedBox(height: 1.0.hp),
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
              ),
            ],
          )),
    );
  }
}
