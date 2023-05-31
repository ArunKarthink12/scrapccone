import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/getProfile_controller.dart';

import '../../controller/profileupdate_state_controller.dart';

class ViewProfileImage extends StatefulWidget {
  const ViewProfileImage({Key? key}) : super(key: key);

  @override
  State<ViewProfileImage> createState() => _ViewProfileImageState();
}

class _ViewProfileImageState extends State<ViewProfileImage> {
  ProfileUpdateStateController profileUpdateStateController =
      Get.put(ProfileUpdateStateController());
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Positioned(
        top: 9.0.hp,
        child: SizedBox(
          width: 100.0.wp,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 55.0,
                      child: CircleAvatar(
                          backgroundColor: Color(0xff5EBDB7),
                          radius: 52.0,
                          child: profileController.getProfilemodel[0].data!
                                      .profilePicture ==
                                  ''
                              ? CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/people1.png'),
                                  radius: 50.0,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(profileController
                                              .editprofileimage
                                              .toString())),
                                      shape: BoxShape.circle),

                                  // radius: 50.0,
                                )),
                    ),
                  ),
                ],
              ),
              Text(
                profileController.uName.text.toString(),

                // profileController.uName.text.toString(),
                textAlign: TextAlign.center,
                style: editprofilename,
              )
            ],
          ),
        ),
      );
    });
  }
}
