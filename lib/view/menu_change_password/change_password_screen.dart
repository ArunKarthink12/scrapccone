import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import '../../controller/change_password_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  ChangePaswordController changePaswordController =
      Get.put(ChangePaswordController());
  LoginController loginController = Get.find<LoginController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // RegisterController registerController = Get.find();
  AssetImage? images;
  bool _isPinnewHidden = true;
  bool _isPinnewHidden1 = true;
  bool _isPinnewHidden2 = true;

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

  void _togglecnewPinView2() {
    setState(() {
      _isPinnewHidden2 = !_isPinnewHidden2;
    });
  }

  @override
  void initState() {
    // loginController.loginController();

    log('loginnn2-----${loginController.mobile.text.toString()}');
    super.initState();

    images = const AssetImage(
      "assets/img/changepassword.gif",
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
        body: Form(
          key: formKey,
          child: Stack(
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
                              SizedBox(height: 1.0.hp),
                              Container(
                                height: 40.0.hp,
                                width: 80.0.wp,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: images!)),
                              ),
                              Text('Change Password', style: toptitleStyle),
                              SizedBox(height: 3.0.hp),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '''Create your new password to continue \nyour account''',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                wordSpacing: 2,
                                                letterSpacing: 0.2,
                                                fontSize: 9.0.sp,
                                                color: subtitlecolor,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ],
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
                                  controller:
                                      changePaswordController.oldPassword,
                                  style: forminputstyle,
                                  obscureText: _isPinnewHidden2,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: appcolor, width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: const Color(0xffC6C6C6)
                                                .withOpacity(0.5),
                                            width: 1),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: _togglecnewPinView2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 5, bottom: 15),
                                          child: Icon(
                                            _isPinnewHidden2
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                      fillColor: const Color(0xffC6C6C6),
                                      hintText: 'old Password',
                                      contentPadding:
                                          const EdgeInsets.only(left: 10),
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
                                  controller:
                                      changePaswordController.newPassword,
                                  style: forminputstyle,
                                  obscureText: _isPinnewHidden1,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: appcolor, width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: const Color(0xffC6C6C6)
                                                .withOpacity(0.5),
                                            width: 1),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: _togglecnewPinView1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 5, bottom: 15),
                                          child: Icon(
                                            _isPinnewHidden1
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                      fillColor: const Color(0xffC6C6C6),
                                      hintText: 'Create Password',
                                      contentPadding:
                                          const EdgeInsets.only(left: 10),
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
                                  controller:
                                      changePaswordController.confirmPassword,
                                  style: forminputstyle,
                                  obscureText: _isPinnewHidden,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: appcolor, width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: const Color(0xffC6C6C6)
                                                .withOpacity(0.5),
                                            width: 1),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: _togglecnewPinView,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 5, bottom: 15),
                                          child: Icon(
                                            _isPinnewHidden
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                      fillColor: const Color(0xffC6C6C6),
                                      hintText: 'Confirm Password',
                                      contentPadding:
                                          const EdgeInsets.only(left: 10),
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
                                    await changePaswordController
                                        .changePasswordController(
                                            context: context);
                                  }
                                },
                                bordercolor: appcolor1,
                                text: 'SAVE',
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
          ),
        ));
  }
}
