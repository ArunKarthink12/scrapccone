import 'package:zero_scarp/allpackages.dart';

class ChangeNewPassword extends StatefulWidget {
  const ChangeNewPassword({Key? key}) : super(key: key);

  @override
  State<ChangeNewPassword> createState() => _ChangeNewPasswordState();
}

class _ChangeNewPasswordState extends State<ChangeNewPassword> {
  AssetImage? images;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CreatePaswordController createPaswordController =
      Get.put(CreatePaswordController());
  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
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
                              Text('Create Password', style: toptitleStyle),
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
                                      createPaswordController.newpassword,
                                  obscureText: _isPinnewHidden1,
                                  style: forminputstyle,
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
                                      hintText: 'New Password',
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
                                      createPaswordController.confirmpassword,
                                  obscureText: _isPinnewHidden2,
                                  style: forminputstyle,
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
                                    await createPaswordController
                                        .createPasswordController(
                                            mobileNumber:
                                                forgotPasswordController
                                                    .mobile.text,
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
