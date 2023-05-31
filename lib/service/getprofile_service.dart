import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/getProfile_response.dart';

import '../model/profileUpdate_city_response.dart';
import '../model/profile_edit_response.dart';
import '../model/profileupdate_state_response.dart';

class GetProfileService {
  Future getProfileService() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken).toString();
    log('token----$token');
    log(Urls.getprofile.toString());
    try {
      var response = await http.post(
        Uri.parse(Urls.getprofile),
        headers: {'Authorization': 'Bearer $token'},
      );
      log("out--->${response.body}");
      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (jsonresponse['status'] == 'success') {
          return ProfileUpdateModelClass.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message']);
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  ///
  ///with dio
  ///
  Future prodileUpdateService(
      {userName,
      mobileNumber,
      companyName,
      gstNumber,
      address,
      street,
      state,
      city,
      profile_picture,
      pincode,
      email}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(Constants.authToken);
    String fileNames = '';
    log("username-->$userName");
    log("mobileNumber-->$mobileNumber");
    log("companyName-->$companyName");
    log("gstNumber-->$gstNumber");
    log("address-->$address");
    log("street-->$street");
    log("state-->$state");
    log("city-->$city");
    log("profile_picture-->$profile_picture");
    log("pincode-->$pincode");
    log("email-->$email");
    // if (profile_picture != '') {
    //   log("Filename-->$fileNames");
    //   fileNames = profile_picture.toString().split('/').last;
    // }
    // log("Filename-->$fileNames");
    if (profile_picture != '') {
      log("Filename-->$fileNames");
      fileNames = profile_picture.toString().split('/').last;
    }
    try {
      dio.FormData formData;
      if (profile_picture == '') {
        formData = dio.FormData.fromMap({
          "userName": userName ?? '',
          "mobileNumber": mobileNumber ?? '',
          "companyName": companyName ?? '',
          "gstNumber": '213',
          "address": address ?? '',
          "street": street ?? '',
          "state": state ?? '',
          "city": city ?? '',
          "pincode": pincode ?? '',
          "email_id": email ?? '',
          "profileImage": ''
        });
      } else {
        formData = dio.FormData.fromMap({
          "userName": userName ?? '',
          "mobileNumber": mobileNumber ?? '',
          "companyName": companyName ?? '',
          "gstNumber": gstNumber ?? '',
          "address": address ?? '',
          "street": street ?? '',
          "state": state ?? '',
          "city": city ?? '',
          "pincode": pincode ?? '',
          "email_id": email ?? '',
          "profileImage": await dio.MultipartFile.fromFile(
            profile_picture,
            filename: fileNames,
            contentType: MediaType(
              "image",
              "jpg",
            ),
          )
        });
      }
      log("formdata-->$formData");
      dio.Response response = await dio.Dio().post(Urls.getprofileEdit,
          data: formData,
          options: dio.Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ));
      log("image-->${response.data}");

      if (response.statusCode == 200) {
        var json = response.data;
        if (json['status'] == 'success') {
          Fluttertoast.showToast(
            msg: response.data["message"],
          );
          return ProfileUpdateModel.fromJson(json);
          // return response.data["message"];
        } else {
          Fluttertoast.showToast(msg: json['message']);
          // return null;
        }
      } else {
        Fluttertoast.showToast(
          msg: response.data["message"],
        );
      }
      // else if ((response.statusCode == 400 ||
      //     response.statusCode == 409 ||
      //     response.statusCode == 401)) {
      //   Fluttertoast.showToast(
      //     msg: response.data["message"],
      //   );
      // }
      // return null;
    } on dio.DioError catch (e) {
      print("eabl-->${e.error}");
    }
  }

  ///
  ///without dio
  ///
  // Future prodileUpdateService(
  //     {userName,
  //     mobileNumber,
  //     companyName,
  //     gstNumber,
  //     address,
  //     street,
  //     state,
  //     city,
  //     // profile_picture,
  //     pincode,
  //     email}) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var token = sharedPreferences.getString(Constants.authToken);
  //   // String fileNames = '';
  //   // if (profile_picture != '') {
  //   //   fileNames = profile_picture.toString().split('/').last;
  //   // }
  //   var data = {
  //     "userName": userName ?? '',
  //     "mobileNumber": mobileNumber ?? '',
  //     "companyName": companyName ?? '',
  //     "gstNumber": gstNumber ?? '',
  //     "address": address ?? '',
  //     "street": street ?? '',
  //     "state": state ?? '',
  //     "city": city ?? '',
  //     // "profileImage": profile_picture ?? '',
  //     // "profileImage":
  //     //  await dio.MultipartFile.fromFile(
  //     //   profile_picture,
  //     //   filename: fileNames,
  //     //   contentType: MediaType(
  //     //     "image",
  //     //     "jpg",
  //     //   ),
  //     // ),
  //     "pincode": pincode ?? '',
  //     "email_id": email ?? '',
  //   };
  //   try {
  //     var response = await http.post(Uri.parse(Urls.getprofileEdit),
  //         headers: {'Authorization': 'Bearer $token'}, body: data);
  //     log(response.body);
  //     var jsonresponse = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       if (jsonresponse['status'] == 'success') {
  //         Fluttertoast.showToast(msg: jsonresponse['message']);
  //         return ProfileUpdateModel.fromJson(jsonresponse);
  //       } else {
  //         Fluttertoast.showToast(msg: jsonresponse['message']);
  //         return null;
  //       }
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //state and city

  Future profileUpdteStateService() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString(Constants.authToken);
      var response = await http.post(
        Uri.parse(Urls.getprofileEditState),
        headers: {'Authorization': 'Bearer $token'},
      );

      var jsonresponse = jsonDecode(response.body);
      // log("responseeeee${response.body.toString()}");

      if (response.statusCode == 200) {
        return ProfileUpdatStateModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future profileUpdtecityService({stateId}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString(Constants.authToken);
      log(stateId.toString());
      var data = {"state_id": stateId};
      var response = await http.post(Uri.parse(Urls.getprofileEditCity),
          headers: {'Authorization': 'Bearer $token'}, body: data);

      var jsonresponse = jsonDecode(response.body);
      // log(response.body.toString());

      if (response.statusCode == 200) {
        return ProfileUpdatCityModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
