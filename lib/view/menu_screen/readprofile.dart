import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/profileupdate_state_controller.dart';

import '../../controller/getProfile_controller.dart';
import 'readdetailsection.dart';
import 'viewProfileImage.dart';

class ReadProfileScreen extends StatefulWidget {
  const ReadProfileScreen({Key? key}) : super(key: key);

  @override
  State<ReadProfileScreen> createState() => _ReadProfileScreenState();
}

class _ReadProfileScreenState extends State<ReadProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProfileController profileController = Get.put(ProfileController());
  // LoginController loginController = Get.put(LoginController());
  // ignore: prefer_final_fields

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    // profileController.isProfileLoad(true);
    await profileController.profileController().then((value) {
      var data = profileController.getProfilemodel[0].data!;
      profileController.uName.text = data.userName ?? '';
      profileController.ucompanyName.text = data.companyName ?? '';
      profileController.uemail.text = data.emailId ?? '';
      profileController.umobileNumber.text = data.mobileNumber ?? '';
      profileController.gstNumber.text = data.gstNumber ?? '';
      profileController.uaddress.text = data.address ?? '';
      profileController.ustreet.text = data.street ?? '';
      profileController.upincode.text = data.pincode ?? '';
      profileController.ustate.value = data.stateId ?? "";
      profileController.ucity.value = data.cityId ?? '';
      profileController.ucityName.value = data.city ?? '';
      profileController.ustateName.value = data.state ?? '';
      profileController.editprofileimage = data.profilePicture ?? '';
    });
    log('uploadedimage == > ${profileController.editprofileimage.toString()}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileController.isProfileLoad.isTrue) {
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
                  Stack(
                    children: [
                      Center(
                          child: Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 4.00.hp),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
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
                      )),
                      Padding(
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
                          child: const ReadDetailSection(),
                          // const DetailsSection()
                        ),
                      ),
                      ViewProfileImage(),
                    ],
                  ),
                ],
              ),
            ),
          )),
        );
      }
    });
  }
}
