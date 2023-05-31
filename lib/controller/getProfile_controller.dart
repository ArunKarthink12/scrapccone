import 'dart:developer';
import 'dart:io';

import 'package:zero_scarp/allpackages.dart';

import 'package:zero_scarp/model/getProfile_response.dart';
import 'package:zero_scarp/model/profileupdate_state_response.dart';
import 'package:dio/dio.dart' as dio;
import '../model/profileUpdate_city_response.dart';
import '../model/profile_edit_response.dart';
import '../service/getprofile_service.dart';

class ProfileController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController uName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController umobileNumber = TextEditingController();

  TextEditingController companyName = TextEditingController();
  TextEditingController ucompanyName = TextEditingController();

  TextEditingController gstNumber = TextEditingController();
  // RxString ugstNumber = ''.obs;

  TextEditingController address = TextEditingController();
  TextEditingController uaddress = TextEditingController();

  TextEditingController street = TextEditingController();
  TextEditingController ustreet = TextEditingController();

  TextEditingController pincode = TextEditingController();
  TextEditingController upincode = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController uemail = TextEditingController();
  // RxString statenamecontrol = ''.obs;
  //id
  RxString city = ''.obs;
  RxString ucity = ''.obs;
  RxString state = ''.obs;
  RxString ustate = ''.obs;
  RxBool isProfileLoad = true.obs;
  RxString locationarea = ''.obs;
  RxString locationcity = ''.obs;
  RxList<ProfileUpdateModelClass> _getProfilemodel =
      <ProfileUpdateModelClass>[].obs;
  RxList<ProfileUpdateModelClass> get getProfilemodel => _getProfilemodel;

  var profileservice = GetProfileService();

  RxBool profileUpdateLoad = true.obs;
  // List<ProfileUpdateModel> _profileupdate = [];
  // List<ProfileUpdateModel> get getprofileUpdate => _profileupdate;

  RxList<ProfileUpdatStateModel> _profileupdatestate =
      <ProfileUpdatStateModel>[].obs;
  List<ProfileUpdatStateModel> get getprofileUpdatestate => _profileupdatestate;
  RxList<ProfileUpdatCityModel> _profileupdateCity =
      <ProfileUpdatCityModel>[].obs;
  RxList<ProfileUpdatCityModel> get getprofileUpdateCity => _profileupdateCity;
  //name
  RxString stateName = ''.obs;
  RxString ustateName = ''.obs;
  RxString cityName = ''.obs;
  RxString ucityName = ''.obs;
  Rx<int> selectedIndex = 0.obs;
  File profileimage = File("");
  // File profileimagepath = File("");
  var editprofileimage;
  // RxBool generalLoad = true.obs;

  RxBool isStateLoading = true.obs;
  RxBool isCityLoading = true.obs;
  var profileusername;
  // var apiprofile;
  // cleardatas() {
  //   userName.text = '';
  //   companyName.text = '';
  //   email.text = '';
  //   mobileNumber.text = '';
  //   gstNumber.text = '';
  //   address.text = '';
  //   street.text = '';
  //   pincode.text = '';
  //   state.value = '';
  //   city.value = '';
  //   cityName.value = '';
  //   stateName.value = '';
  //   profileimage = File('');
  // }

  profileController() async {
    try {
      var response = await profileservice.getProfileService();
      if (response != null) {
        _getProfilemodel.clear();
        _getProfilemodel.add(response);
        isProfileLoad(false);
      } else {
        isProfileLoad(false);
      }
    } catch (e) {
      log("e--->$e");
      rethrow;
    }
  }

// {"status":"success","message":"User details","data":{"userName":"arun","companyName":"qwww","email_id":"karthi.nk@gmail.com","mobileNumber":"7708491725","gstNumber":"12","address":"test","street":"test","state_id":"12","city_id":"779","state":"Gujarat","city":"Abrama","pincode":"12312345","profile_picture":"https:\/\/propluslogics.in\/zero_scrap_api\/uploads\/members\/637f38b35a635_1669281971.jpg","created_at":"2022-11-24 14:56:11"}}
  //update
  Future profileUpdateController(context) async {
    if (userName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter user name');
    } else if (mobileNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter mobile number');
    } else if (email.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter emailID');
    } else if (companyName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter companyname');
    }
    // else if (gstNumber.text.isEmpty) {
    //   Fluttertoast.showToast(msg: 'Please enter gstnumbr');
    // }
    else if (address.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter address');
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter street');
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter pincode');
    } else if (city.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter city');
    } else if (state.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter state');
    }
    // else if (gstNumber.text.length < 2) {
    //   Fluttertoast.showToast(
    //       msg: 'The gst number must be at least 2 characters');
    // }
    else {
      try {
        // log("looooo_____>>>$editprofileimage");
        // log("looooo_____>>>${profileimage.path}");

        if (profileUpdateLoad.value) {
          _loadingBar(context);
        }
        var response;
        if (profileimage == File('')) {
          response = await profileservice.prodileUpdateService(
              userName: userName.text,
              mobileNumber: mobileNumber.text,
              companyName: companyName.text,
              // gstNumber: gstNumber.text,
              address: address.text,
              state: state.value,
              street: street.text,
              city: city.value,
              profile_picture: '',
              pincode: pincode.text,
              email: email.text);
        } else {
          response = await profileservice.prodileUpdateService(
              userName: userName.text,
              mobileNumber: mobileNumber.text,
              companyName: companyName.text,
              gstNumber: gstNumber.text,
              address: address.text,
              state: state.value,
              street: street.text,
              city: city.value,
              profile_picture: profileimage.path,
              pincode: pincode.text,
              email: email.text);
        }
        if (response != null) {
          isProfileLoad(true);
          isCityLoading(true);
          isCityLoading(true);

          profileUpdateLoad(false);
          profileimage = File('');
          Get.to(HomePage());
        } else {
          profileUpdateLoad(false);
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  //state
  Future getState() async {
    try {
      var response = await profileservice.profileUpdteStateService();
      if (response != null) {
        _profileupdatestate.clear();
        _profileupdatestate.add(response);
        isCityLoading(false);
        isStateLoading(false);
      } else {
        isStateLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getCity({stateId}) async {
    try {
      var response =
          await profileservice.profileUpdtecityService(stateId: stateId);
      if (response != null) {
        _profileupdateCity.clear();
        _profileupdateCity.add(response);
        // log('city_res--->$cityName');
        isCityLoading(false);
      } else {
        isCityLoading(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}

void _loadingBar(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return const Center(
          child: Loader(),
        );
      });
}
