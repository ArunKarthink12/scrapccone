import 'dart:developer';
import 'dart:io';
import 'dart:math';
// import 'package:dio/dio.dart' as dio;
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:path/path.dart';

// import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/getProfile_controller.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;
import '../../controller/profileupdate_state_controller.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  ProfileUpdateStateController profileUpdateStateController =
      Get.put(ProfileUpdateStateController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return
        //  Obx(() {
        //   return
        //   if (profileController.isProfileLoad.value ==true||
        //       profileController.isStateLoading.value ==true||
        //       profileController.isCityLoading.value==true) {
        //     return const Scaffold(
        //       body: Center(
        //         child: CircularProgressIndicator(),
        //       ),
        //     );
        //   } else {
        //     return
        Positioned(
      top: 9.0.hp,
      child: SizedBox(
        width: 100.0.wp,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // log("Profile");
                setState(() {
                  profilefilepicker();
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (profileController.profileimage.path == '') ...[
                    if (profileController
                            .getProfilemodel[0].data!.profilePicture ==
                        '') ...[
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 55.0,
                          child: CircleAvatar(
                              // backgroundColor: Colors.amber,
                              radius: 52.0,
                              child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/people1.png')),
                                    shape: BoxShape.circle),
                              )),
                        ),
                      ),
                    ] else ...[
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 55.0,
                          child: CircleAvatar(
                              backgroundColor: const Color(0xff5EBDB7),
                              radius: 52.0,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(profileController
                                                .getProfilemodel[0]
                                                .data!
                                                .profilePicture
                                                .toString()
                                            // profileController
                                            //   .getProfilemodel[0]
                                            //   .data!
                                            //   .profilePicture
                                            //   .toString()
                                            )),
                                    shape: BoxShape.circle),

                                // radius: 50.0,
                              )),
                        ),
                      ),
                    ]
                  ] else ...[
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 55.0,
                        child: CircleAvatar(
                            backgroundColor: const Color(0xff5EBDB7),
                            radius: 52.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                          profileController.profileimage)),
                                  shape: BoxShape.circle),
                            )),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            Text(
              ///edit screen
              profileController.getProfilemodel[0].data!.userName.toString(),
              textAlign: TextAlign.center,
              style: editprofilename,
            )
          ],
        ),
      ),
    );
    // });
  }

  Future profilefilepicker() async {
    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    final file = File(result!.path);

    if (result != null) {
      setState(() {
        profileController.profileimage = file;
      });
    } else {
      return null;
    }
  }
}
