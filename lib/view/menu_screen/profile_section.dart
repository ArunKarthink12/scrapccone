import 'package:zero_scarp/allpackages.dart';

import '../../controller/getProfile_controller.dart';
import '../../controller/profileupdate_state_controller.dart';

class ProfileSection extends StatefulWidget {
  ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  ProfileUpdateStateController profileUpdateStateController =
      Get.put(ProfileUpdateStateController());
  ProfileController profileController = Get.put(ProfileController());
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 34.0,
              child: CircleAvatar(
                  backgroundColor: Color(0xff5EBDB7),
                  radius: 32.0,
                  child: profileController
                          .getProfilemodel[0].data!.profilePicture!.isEmpty
                      //  profileController.profileimage.path.isEmpty
                      ? const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/people1.png'),
                          radius: 50.0,
                        )
                      : Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      profileController.editprofileimage)),
                              shape: BoxShape.circle),
                        )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 3),
                child: Row(
                  children: [
                    Text(
                      ///menu screen
                      profileController.getProfilemodel[0].data!.userName
                          .toString(),
                      style: menuprofilesection,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => EditProfileScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 9),
                child: Image.asset(
                  'assets/images/edit_profile.png',
                  height: 30,
                  width: 30,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
