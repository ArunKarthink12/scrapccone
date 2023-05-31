import 'dart:developer';
import 'dart:io';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/profileupdate_state_controller.dart';

import '../../controller/getProfile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProfileController profileController = Get.put(ProfileController());
  ProfileUpdateStateController profileUpdateStateController =
      Get.put(ProfileUpdateStateController());

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    //     log("value--${profileController.getProfilemodel[0].data!.state}");
    //     log("value--${profileController.getProfilemodel[0].data!.city}");
    //     log("value--${profileController.getProfilemodel[0].data!.cityId}");
    //     log("value--${profileController.getProfilemodel[0].data!.stateId}");
    //     log("value--${data.state}");
    //     log("value--${data.stateId}");
    //     log("value--${data.city}");
    //     log("value--${data.cityId}");
    // profileController.isProfileLoad(true);
    var data = profileController.getProfilemodel[0].data!;
    await profileController.profileController().then((value) async {
      profileController.userName.text = data.userName ?? '';
      profileController.companyName.text = data.companyName ?? '';
      profileController.email.text = data.emailId ?? '';
      profileController.mobileNumber.text = data.mobileNumber ?? '';
      profileController.gstNumber.text = data.gstNumber ?? '';
      profileController.address.text = data.address ?? '';
      profileController.street.text = data.street ?? '';
      profileController.pincode.text = data.pincode ?? '';
      profileController.state.value = data.stateId ?? "";
      profileController.city.value = data.cityId ?? '';

      profileController.stateName.value = data.state ?? '';
      profileController.cityName.value = data.city ?? '';
      profileController.editprofileimage = data.profilePicture ?? '';
      if (data.state != '') {
        profileController.getCity(stateId: data.stateId);
      }
    });
    log("image--->file-->${profileController.editprofileimage}");
    await profileController.getState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // profileController.isProfileLoad(true);
        // profileController.isStateLoading(true);
        // profileController.isCityLoading(true);
        profileController.profileimage = File('');
        return true;
      },
      child: Obx(() {
        if (profileController.isProfileLoad.value == true ||
            profileController.isStateLoading.value == true ||
            profileController.isCityLoading.value == true) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: const Color(0xff5EBDB7),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      child: Stack(
                        children: [
                          Center(
                              child: SizedBox(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 10.0, top: 4.00.hp),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // profileController.cleardatas();
                                      profileController.profileimage = File('');
                                      Get.back();
                                    },
                                    child: Image.asset(
                                      'assets/images/back_arrow.png',
                                      height: 35,
                                      width: 35,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                          SizedBox(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 16.0.hp,
                              ),
                              child: Container(
                                  width: 100.0.wp,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      )),
                                  child: DetailsSection()),
                            ),
                          ),
                          const ProfileImage(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100.0.wp,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SmallActionButton(
                                  press: () {
                                    profileController.profileimage = File('');
                                    Navigator.of(context).pop();
                                  },
                                  elevationvalue: 0,
                                  text: 'CANCEL',
                                  bordercolor: Colors.white,
                                  bgcolor: appcolor,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 11.0.sp,
                                          letterSpacing: 1.5,
                                          color: screenbackground,
                                          fontWeight: FontWeight.w500)),
                                ),
                                SmallActionButton(
                                  press: () async {
                                    // print('clickkk');
                                    // log("Check--->${profileController.editprofileimage}");
                                    // log("Check--->${profileController.profileimage}");
                                    // if (profileController.profileimage ==
                                    //     File('')) {
                                    //   // log("Check--->${profileController.profileimage.path}");
                                    //   log("Check--->${profileController.editprofileimage}");
                                    // profileController.profileimage =
                                    //     profileController.editprofileimage;
                                    //   // log("img-->${profileController.profileimage}");
                                    //   // updatedetail(context);
                                    //   // Fluttertoast.showToast(msg: "Upload image");
                                    // } else {
                                    updatedetail(context);
                                    // }
                                    setState(() {});
                                  },
                                  elevationvalue: 0,
                                  text: 'SAVE',
                                  bordercolor: const Color(0xff283736),
                                  bgcolor: const Color(0xff283736),
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 11.0.sp,
                                          letterSpacing: 1.5,
                                          color: screenbackground,
                                          fontWeight: FontWeight.w500)),
                                )
                              ]),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
          );
        }
      }),
    );
  }

  updatedetail(context) async {
    await profileController.profileUpdateController(context);
  }
}
