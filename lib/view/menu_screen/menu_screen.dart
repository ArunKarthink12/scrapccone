import 'dart:developer';
import 'dart:io';

import 'package:zero_scarp/allpackages.dart';

import '../../controller/getProfile_controller.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  LoginController loginController = Get.put(LoginController());
  ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    log('token');
    profileController.userName.text =
        sharedPreferences.getString(Constants.userName).toString();

    profileController.profileController().then((value) async {
      var data = profileController.getProfilemodel[0].data!;
      profileController.uName.text = data.userName ?? '';
      profileController.ucompanyName.text = data.companyName ?? '';
      profileController.uemail.text = data.emailId ?? '';
      profileController.umobileNumber.text = data.mobileNumber ?? '';
      profileController.gstNumber.text = data.gstNumber ?? '';
      profileController.uaddress.text = data.address ?? '';
      profileController.ustreet.text = data.street ?? '';
      profileController.upincode.text = data.pincode ?? '';
      profileController.state.value = data.stateId ?? "";
      profileController.city.value = data.cityId ?? '';
      profileController.cityName.value = data.city ?? '';
      profileController.stateName.value = data.state ?? '';
      profileController.editprofileimage = data.profilePicture ?? '';

      log("uname-->${profileController.uName.text}");
      if (data.state!.isNotEmpty) {
        await profileController.getCity(stateId: data.stateId);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Get.offAll(HomePage());
      return true;
    }, child: Obx(() {
      if (profileController.isProfileLoad.value == true) {
        return SafeArea(
          child: const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
        //   } else if (profileController.getProfilemodel.isEmpty) {
        //     return Scaffold(
        //       body: Text("Profile"),
        //     );
      } else {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xff5EBDB7),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 3.0.hp,
                  ),
                  ProfileSection(),
                  SizedBox(
                    height: 3.0.hp,
                  ),
                  Container(
                    width: 100.0.wp,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        OptionList(),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                              color: const Color(0xff5EBDB7),
                              border: Border.all(
                                color: const Color(0xff5EBDB7),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(const LoginScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xff5EBDB7),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              textStyle: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 11.0.sp,
                                      letterSpacing: 1.5,
                                      color: screenbackground,
                                      fontWeight: FontWeight.w500)),
                            ),
                            child: InkWell(
                              onTap: () async {
                                await loginController.logout();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'LOGOUT',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.0.sp,
                                            letterSpacing: 1.5,
                                            color: screenbackground,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Image.asset(
                                      'assets/images/logout.png',
                                      height: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0.hp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }));
    //   }
    // }),
    // );
  }
}
