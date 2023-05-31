import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/fill_details_controller.dart';
import 'package:zero_scarp/controller/getProfile_controller.dart';
import 'package:zero_scarp/controller/multiaddresslistcontroller.dart';
import 'package:zero_scarp/controller/selectedaddresscontroller.dart';

import '../../controller/history_controller.dart';
import '../../controller/withgstcontroller.dart';
import '../../serverSideError/errorhandling.dart';
import 'delivaryaddres.dart';

class FillDetails extends StatefulWidget {
  var gstvisible;
  FillDetails({Key? key, this.gstvisible}) : super(key: key);

  @override
  State<FillDetails> createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  FillDetailsController fillDetailsController =
      Get.put(FillDetailsController());
  ProfileController profileController = Get.put(ProfileController());
  // WithGstController withGstController = Get.put(WithGstController());
  History_Controller history_controller = Get.put(History_Controller());
  final _formKey = GlobalKey<FormState>();
  MultiaddressController multiaddressController =
      Get.put(MultiaddressController());
  // SelectaddressController selectaddressController =
  //     Get.put(SelectaddressController());
  // // var city;
  @override
  void initState() {
    // fillDetailsController.fillDetailsController();
    getFnc();

    super.initState();
  }

  getFnc() {
    // Get.delete<MultiaddressController>();
    fillDetailsController.getState();
    multiaddressController.multiaddresscontrollerdatas();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            color: const Color(0xffD9D9D9).withOpacity(0.1),
            // height: 7.0.hp,
            // height: 6.0.hp,
            width: 95.0.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              controller: fillDetailsController.userName,
              autovalidateMode: fillDetailsController.isError.isTrue
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter userName name';
                } else if (value.isNotEmpty &&
                    fillDetailsController.isError.isTrue) {
                  return null;
                } else {
                  return null;
                }
              },
              // companyName
              style: GoogleFonts.jost(
                  textStyle: TextStyle(
                      fontSize: 10.0.sp,
                      color: forminputcolor,
                      fontWeight: FontWeight.w500)),
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: appcolor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: const Color(0xffC6C6C6).withOpacity(0.5),
                        width: 1),
                  ),
                  fillColor: const Color(0xffC6C6C6),
                  hintText: 'Full Name *',
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintStyle: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontSize: 10.0.sp,
                          color: formhintcolor,
                          fontWeight: FontWeight.w500)),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: const Color(0xffD9D9D9).withOpacity(0.1),
            // height: 6.0.hp,
            // height: 7.0.hp,
            width: 95.0.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              controller: fillDetailsController.companyName,
              autovalidateMode: fillDetailsController.isError.isTrue
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter company name';
                } else if (value.isNotEmpty &&
                    fillDetailsController.isError.isTrue) {
                  // log("serverside--?${fillDetailsController.errorList}");

                  ///Use this code
                  // String data = SignUpErrorHandling.signUpErrorHandling(
                  //     response: fillDetailsController.errorList,
                  //     key: 'userName');

                  // return data == '' ? null : data;
                  return null;
                } else {
                  return null;
                }
              },
              style: GoogleFonts.jost(
                  textStyle: TextStyle(
                      fontSize: 10.0.sp,
                      color: forminputcolor,
                      fontWeight: FontWeight.w500)),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: appcolor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: const Color(0xffC6C6C6).withOpacity(0.5),
                        width: 1),
                  ),
                  fillColor: const Color(0xffC6C6C6),
                  hintText: 'Company Name *',
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintStyle: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontSize: 10.0.sp,
                          color: formhintcolor,
                          fontWeight: FontWeight.w500)),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: const Color(0xffD9D9D9).withOpacity(0.1),
            // height: 6.0.hp,
            // height: 7.0.hp,
            width: 95.0.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              controller: fillDetailsController.emailid,
              autovalidateMode: fillDetailsController.isError.isTrue
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter emailId';
                } else if (value.isNotEmpty &&
                    fillDetailsController.isError.isTrue) {
                  // log("serverside--?${fillDetailsController.errorList}");

                  ///Use this code
                  // String data = SignUpErrorHandling.signUpErrorHandling(
                  //     response: fillDetailsController.errorList,
                  //     key: 'userName');

                  // return data == '' ? null : data;
                  return null;
                } else {
                  return null;
                }
              },
              style: GoogleFonts.jost(
                  textStyle: TextStyle(
                      fontSize: 10.0.sp,
                      color: forminputcolor,
                      fontWeight: FontWeight.w500)),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: appcolor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: const Color(0xffC6C6C6).withOpacity(0.5),
                        width: 1),
                  ),
                  fillColor: const Color(0xffC6C6C6),
                  hintText: 'Email ID *',
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintStyle: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontSize: 10.0.sp,
                          color: formhintcolor,
                          fontWeight: FontWeight.w500)),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: const Color(0xffD9D9D9).withOpacity(0.1),
            // height: 6.0.hp,
            // height: 9.0.hp,
            width: 95.0.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              controller: fillDetailsController.mobileNumber,
              autovalidateMode: fillDetailsController.isError.isTrue
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter mobile number';
                } else if (value.length < 10) {
                  return 'Mobile number length should be equal to 10';
                } else if (value.isNotEmpty &&
                    fillDetailsController.isError.isTrue) {
                  // log("serverside--?${fillDetailsController.errorList}");

                  ///Use this code
                  // String data = SignUpErrorHandling.signUpErrorHandling(
                  //     response: fillDetailsController.errorList,
                  //     key: 'userName');

                  // return data == '' ? null : data;
                  return null;
                } else {
                  return null;
                }
              },
              // maxLength: 10,
              keyboardType: TextInputType.number,
              style: GoogleFonts.jost(
                  textStyle: TextStyle(
                      fontSize: 10.0.sp,
                      color: forminputcolor,
                      fontWeight: FontWeight.w500)),
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: appcolor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: const Color(0xffC6C6C6).withOpacity(0.5),
                        width: 1),
                  ),
                  fillColor: const Color(0xffC6C6C6),
                  hintText: 'Mobile Number *',
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintStyle: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontSize: 10.0.sp,
                          color: formhintcolor,
                          fontWeight: FontWeight.w500)),
                  border: const OutlineInputBorder(
                    gapPadding: 4.0,
                  )),
            ),
          ),
          SizedBox(
            height: 4.0.hp,
          ),
          Container(
            height: 2.8.hp,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xffF3F3F3),
          ),
          SizedBox(
            height: 2.5.hp,
          ),
          // Visibility(
          //   visible: widget.gstvisible == 0 ? true : false,
          //   child: Column(
          //     children: [
          //       Container(
          //         color: const Color(0xffD9D9D9).withOpacity(0.1),
          //         height: 7.0.hp, width: 95.0.wp,
          //         // padding: const EdgeInsets.only(
          //         //   left: 20,
          //         //   right: 20,
          //         // ),
          //         child: TextFormField(
          //           controller: fillDetailsController.gstNumber,
          //           style: GoogleFonts.jost(
          //               textStyle: TextStyle(
          //                   fontSize: 10.0.sp,
          //                   color: forminputcolor,
          //                   fontWeight: FontWeight.w500)),
          //           decoration: InputDecoration(
          //               focusedBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(5.0),
          //                 borderSide:
          //                     const BorderSide(color: appcolor, width: 1),
          //               ),
          //               enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(5.0),
          //                 borderSide: BorderSide(
          //                     color:
          //                         const Color(0xffC6C6C6).withOpacity(0.5),
          //                     width: 1),
          //               ),
          //               fillColor: const Color(0xffC6C6C6),
          //               hintText: 'GST Number ',
          //               contentPadding: const EdgeInsets.only(left: 10),
          //               hintStyle: GoogleFonts.jost(
          //                   textStyle: TextStyle(
          //                       fontSize: 10.0.sp,
          //                       color: formhintcolor,
          //                       fontWeight: FontWeight.w500)),
          //               border: const OutlineInputBorder(
          //                 gapPadding: 4,
          //               )),
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 15,
          //       ),
          //     ],
          //   ),
          // ),

          const SizedBox(
            height: 15,
          ),
          Obx(() {
            if (fillDetailsController.isStateLoading.value &&
                multiaddressController.multiaddressloading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (multiaddressController
                .multiaddressdatas.first.data.isNotEmpty) {
              var datas = multiaddressController.multiaddressdatas.first.data;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.only(left: 2.5.sp),
                          child: Text(
                            'Address info',
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 13.0.sp,
                                    color: const Color(0xff263238),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Get.delete<MultiaddressController>();

                            Get.to(const DeliveryAddress());
                          },
                          child: Container(
                            height: 4.0.hp,
                            width: 35.0.wp,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: appcolor,
                                borderRadius: BorderRadius.circular(7.0.sp)),
                            child: Text(
                              "Change Address",
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 9.7.sp),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      width: 95.0.wp,
                      height: 16.0.hp,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Color(0xffC6C6C6), width: 1),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text:
                              "${datas[fillDetailsController.selectaddressindex.value].address}\n",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0.sp,
                              height: 1.9,
                              color: Color(0xffA3A3A3)),
                          children: [
                            TextSpan(
                                text:
                                    "${datas[fillDetailsController.selectaddressindex.value].street}\n",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.0.sp,
                                    height: 1.9,
                                    color: Color(0xffA3A3A3))),
                            TextSpan(
                                text:
                                    "${datas[fillDetailsController.selectaddressindex.value].city}, "
                                    '${datas[fillDetailsController.selectaddressindex.value].state}\n',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.0.sp,
                                    height: 1.9,
                                    color: Color(0xffA3A3A3))),
                            TextSpan(
                                text:
                                    'Pincode - ${datas[fillDetailsController.selectaddressindex.value].pincode}\n',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.0.sp,
                                    height: 1.9,
                                    color: Color(0xffA3A3A3))),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 2.0.hp,
                  )
                ],
              );
            } else {
              return Column(
                children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.only(left: 2.5.sp),
                            child: Text(
                              'Address info',
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 13.0.sp,
                                      color: const Color(0xff263238),
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    Container(
                      color: const Color(0xffD9D9D9).withOpacity(0.1),
                      width: 95.0.wp,
                      child: TextFormField(
                        controller: fillDetailsController.address,
                        autovalidateMode: fillDetailsController.isError.isTrue
                            ? AutovalidateMode.always
                            : AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Address Field';
                          } else if (value.isNotEmpty &&
                              fillDetailsController.isError.isTrue) {
                            return null;
                          } else {
                            return null;
                          }
                        },
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.0.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
                                  width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: 'Flat no/ Building name *',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.0.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      color: const Color(0xffD9D9D9).withOpacity(0.1),
                      // height: 7.0.hp,
                      // height: 6.0.hp,
                      width: 95.0.wp,
                      // padding: const EdgeInsets.only(
                      //   left: 20,
                      //   right: 20,
                      // ),
                      child: TextFormField(
                        controller: fillDetailsController.street,
                        autovalidateMode: fillDetailsController.isError.isTrue
                            ? AutovalidateMode.always
                            : AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter street name';
                          } else if (value.isNotEmpty &&
                              fillDetailsController.isError.isTrue) {
                            // log("serverside--?${fillDetailsController.errorList}");

                            ///Use this code
                            // String data = SignUpErrorHandling.signUpErrorHandling(
                            //     response: fillDetailsController.errorList,
                            //     key: 'userName');

                            // return data == '' ? null : data;
                            return null;
                          } else {
                            return null;
                          }
                        },
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.0.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
                                  width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: 'Street Name *',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.0.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 7.0.hp,
                            width: 95.0.wp,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xFFECE9E9),
                                width:
                                    MediaQuery.of(context).size.height * 0.001,
                              ),
                              color: const Color(0xffD9D9D9).withOpacity(0.1),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: fillDetailsController.state.value.isEmpty
                                    ? null
                                    : fillDetailsController.state.value,
                                hint: Text('State *',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.0.sp,
                                            color: formhintcolor,
                                            fontWeight: FontWeight.w500))),
                                onChanged: (String? newValue) async {
                                  fillDetailsController.state.value =
                                      newValue ?? '';
                                  fillDetailsController.city('');
                                  await fillDetailsController.getCity(
                                      stateId: newValue);
                                  setState(() {});
                                },
                                icon: Image.asset(
                                  'assets/images/down.png',
                                  color: const Color(0xFF737070),
                                  height: 10,
                                  width: 10,
                                ),
                                items: fillDetailsController
                                        .getprofileUpdatestate.isEmpty
                                    ? []
                                    : fillDetailsController
                                        .getprofileUpdatestate[0].state!
                                        .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          onTap: () {
                                            fillDetailsController.statename
                                                .value = value.name.toString();
                                            setState(() {});
                                          },
                                          value: value.id.toString(),
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0, right: 4),
                                              child: Text(value.name ?? '',
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          fontSize: 10.0.sp,
                                                          color: forminputcolor,
                                                          fontWeight: FontWeight
                                                              .w500)))),
                                        );
                                      }).toList(),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 7.0.hp,
                            width: 95.0.wp,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xFFECE9E9),
                                width:
                                    MediaQuery.of(context).size.height * 0.001,
                              ),
                              color: const Color(0xffD9D9D9).withOpacity(0.1),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: fillDetailsController.city.value.isEmpty
                                    ? null
                                    : fillDetailsController.city.value,
                                hint: Text('City *',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.0.sp,
                                            color: formhintcolor,
                                            fontWeight: FontWeight.w500))),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    fillDetailsController.city.value =
                                        newValue ?? '';
                                  });
                                },
                                icon: Image.asset(
                                  'assets/images/down.png',
                                  color: const Color(0xFF737070),
                                  height: 10,
                                  width: 10,
                                ),
                                items: fillDetailsController
                                        .getprofileUpdateCity.isEmpty
                                    ? []
                                    : fillDetailsController
                                        .getprofileUpdateCity[0].city!
                                        .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          onTap: () {
                                            fillDetailsController.cityname
                                                .value = value.name.toString();
                                            setState(() {});
                                          },
                                          value: value.id.toString(),
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0, right: 4),
                                              child: Text(value.name.toString(),
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          fontSize: 10.0.sp,
                                                          color: forminputcolor,
                                                          fontWeight: FontWeight
                                                              .w500)))),
                                        );
                                      }).toList(),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      color: const Color(0xffD9D9D9).withOpacity(0.1),
                      // height: 7.0.hp,
                      // height: 6.0.hp,
                      width: 95.0.wp,
                      // padding: const EdgeInsets.only(
                      //   left: 20,
                      //   right: 20,
                      // ),
                      child: TextFormField(
                        controller: fillDetailsController.pincode,
                        keyboardType: TextInputType.number,
                        autovalidateMode: fillDetailsController.isError.isTrue
                            ? AutovalidateMode.always
                            : AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter pincode';
                          } else if (value.isNotEmpty &&
                              fillDetailsController.isError.isTrue) {
                            // log("serverside--?${fillDetailsController.errorList}");

                            ///Use this code
                            // String data = SignUpErrorHandling.signUpErrorHandling(
                            //     response: fillDetailsController.errorList,
                            //     key: 'userName');

                            // return data == '' ? null : data;
                            return null;
                          } else {
                            return null;
                          }
                        },
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.0.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
                                  width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: 'Pincode *',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.0.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                  ]),
                ],
              );
            }
          }),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  camera();
                },
                child: Container(
                  height: 7.0.hp,
                  width: 95.0.wp,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.sp),
                    color: appcolor,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 2.0.wp,
                      ),
                      const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 3.0.wp,
                      ),
                      Text(
                        fillDetailsController.image.path.isEmpty
                            ? "Capture image *"
                            : "Capture again",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 10.5.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                      const Expanded(child: SizedBox()),
                      Visibility(
                        visible: fillDetailsController.image.path.isEmpty
                            ? false
                            : true,
                        child: IconButton(
                            onPressed: () {
                              camera();
                            },
                            icon: const Icon(
                              Icons.replay_outlined,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Visibility(
              visible: fillDetailsController.image.path.isEmpty ? false : true,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Row(children: const [
                        Icon(Icons.play_circle, color: appcolor),
                        Text("preview")
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 31.0.hp,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Image.file(fillDetailsController.image,
                        fit: BoxFit.cover),
                  ),
                ],
              )),
        ],
      ),
    );
  }
  // }
  // });
  // }

  Future camera() async {
    var result = await ImagePicker().pickImage(source: ImageSource.camera);
    File file = File(result!.path);

    if (result != null) {
      setState(() {
        fillDetailsController.image = file;
      });
    } else {
      return null;
    }
  }
}
