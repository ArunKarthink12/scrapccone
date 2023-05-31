import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/getProfile_controller.dart';
import 'package:zero_scarp/controller/profileupdate_state_controller.dart';
import 'package:zero_scarp/utils/common_function/statelist.dart';

class ReadDetailSection extends StatefulWidget {
  const ReadDetailSection({
    Key? key,
  }) : super(key: key);

  @override
  State<ReadDetailSection> createState() => _ReadDetailSectionState();
}

class _ReadDetailSectionState extends State<ReadDetailSection> {
  // var reason;
  // var city;
  // TextEditingController mobile = TextEditingController();
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          SizedBox(
            height: 15.0.hp,
          ),
          Container(
            color: const Color(0xffD9D9D9).withOpacity(0.1),
            height: 7.0.hp, width: 95.0.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              //read screen

              readOnly: true,
              controller: profileController.uName,
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
                  hintText: 'User Name',
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
            height: 7.0.hp, width: 95.0.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              readOnly: true,
              controller: profileController.ucompanyName,
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
                  hintText: 'Company Name',
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
            height: 7.0.hp, width: 95.0.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              readOnly: true,
              controller: profileController.uemail,
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
                  hintText: 'Email ID',
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
            height: 10.0.hp,
            width: 95.0.wp,
            child: TextFormField(
              readOnly: true,

              controller: profileController.umobileNumber,
              enableInteractiveSelection: false,
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'Please Enter mobile Number';
              //   } else if (value.length != 10) {
              //     return "Please enter valid mobile number";
              //   } else {
              //     return null;
              //   }
              // },
              maxLength: 10,
              keyboardType: TextInputType.number,
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
                  hintText: 'Mobile Number',
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
          // Container(
          //   color: const Color(0xffD9D9D9).withOpacity(0.1),
          //   height: 7.0.hp, width: 95.0.wp,
          //   // padding: const EdgeInsets.only(
          //   //   left: 20,
          //   //   right: 20,
          //   // ),
          //   child: TextFormField(
          //     readOnly: true,
          //     controller: profileController.gstNumber,
          //     style: GoogleFonts.jost(
          //         textStyle: TextStyle(
          //             fontSize: 10.0.sp,
          //             color: forminputcolor,
          //             fontWeight: FontWeight.w500)),
          //     decoration: InputDecoration(
          //         focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0),
          //           borderSide: const BorderSide(color: appcolor, width: 1),
          //         ),
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0),
          //           borderSide: BorderSide(
          //               color: const Color(0xffC6C6C6).withOpacity(0.5),
          //               width: 1),
          //         ),
          //         fillColor: const Color(0xffC6C6C6),
          //         hintText: 'GST Number',
          //         contentPadding: const EdgeInsets.only(left: 10),
          //         hintStyle: GoogleFonts.jost(
          //             textStyle: TextStyle(
          //                 fontSize: 10.0.sp,
          //                 color: formhintcolor,
          //                 fontWeight: FontWeight.w500)),
          //         border: const OutlineInputBorder(
          //           gapPadding: 4,
          //         )),
          //   ),
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          Container(
            color: const Color(0xffD9D9D9).withOpacity(0.1),
            height: 7.0.hp, width: 95.0.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              readOnly: true,
              controller: profileController.uaddress,
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
                  hintText: 'Address',
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
            height: 7.0.hp, width: 95.0.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              readOnly: true,
              controller: profileController.ustreet,
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
                  hintText: 'Street Name',
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
              profileController.ustateName.value.isEmpty
                  ? Container(
                      height: 7.0.hp,
                      width: 95.0.wp,
                      padding: EdgeInsets.only(top: 17.0.sp, left: 9.0.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: const Color(0xFFECE9E9),
                          width: MediaQuery.of(context).size.height * 0.001,
                        ),
                      ),
                      child: Text("State",
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: formhintcolor,
                                  fontWeight: FontWeight.w500))),
                    )
                  : Container(
                      height: 7.0.hp,
                      width: 95.0.wp,
                      padding: EdgeInsets.only(top: 17.0.sp, left: 9.0.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: const Color(0xFFECE9E9),
                          width: MediaQuery.of(context).size.height * 0.001,
                        ),
                      ),
                      child: Text(profileController.ustateName.value,
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: forminputcolor,
                                  fontWeight: FontWeight.w500))),
                    ),
            ],
          ),

          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              profileController.ucityName.isEmpty
                  ? Container(
                      height: 7.0.hp,
                      width: 95.0.wp,
                      padding: EdgeInsets.only(top: 17.0.sp, left: 9.0.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: const Color(0xFFECE9E9),
                          width: MediaQuery.of(context).size.height * 0.001,
                        ),
                      ),
                      child: Text("City",
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: formhintcolor,
                                  fontWeight: FontWeight.w500))),
                    )
                  : Container(
                      height: 7.0.hp,
                      width: 95.0.wp,
                      padding: EdgeInsets.only(top: 17.0.sp, left: 9.0.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: const Color(0xFFECE9E9),
                          width: MediaQuery.of(context).size.height * 0.001,
                        ),
                      ),
                      child: Text(profileController.ucityName.value,
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: forminputcolor,
                                  fontWeight: FontWeight.w500))),
                    ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     AbsorbPointer(
          //       absorbing: true,
          //       child: Container(
          //           height: 7.0.hp,
          //           width: 95.0.wp,
          //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(5.0),
          //             border: Border.all(
          //               color: const Color(0xFFECE9E9),
          //               width: MediaQuery.of(context).size.height * 0.001,
          //             ),
          //           ),
          //           child: DropdownButtonHideUnderline(
          //             child: DropdownButton<String>(
          //               value: profileController.city.value.isEmpty
          //                   ? null
          //                   : profileController.city.value,
          //               style: GoogleFonts.jost(
          //                   textStyle: TextStyle(
          //                       fontSize: 10.0.sp,
          //                       color: forminputcolor,
          //                       fontWeight: FontWeight.w500)),
          //               hint: Text('City',
          //                   style: GoogleFonts.jost(
          //                       textStyle: TextStyle(
          //                           fontSize: 10.0.sp,
          //                           color: formhintcolor,
          //                           fontWeight: FontWeight.w500))),
          //               onChanged: (String? newValue) {
          //                 setState(() {
          //                   profileController.city.value = newValue ?? '';
          //                 });
          //               },
          //               icon: Image.asset(
          //                 'assets/images/down.png',
          //                 color: const Color(0xFF737070),
          //                 height: 10,
          //                 width: 10,
          //               ),
          //               items: profileController.getprofileUpdateCity.isEmpty
          //                   ? []
          //                   : profileController.getprofileUpdateCity[0].city!
          //                       .map<DropdownMenuItem<String>>((value) {
          //                       return DropdownMenuItem<String>(
          //                         value: value.name.toString(),
          //                         child: Container(
          //                             margin: const EdgeInsets.only(
          //                                 left: 0, right: 4),
          //                             child: Text(value.name ?? '',
          //                                 style: GoogleFonts.jost(
          //                                     textStyle: TextStyle(
          //                                         fontSize: 10.0.sp,
          //                                         color: forminputcolor,
          //                                         fontWeight: FontWeight.w500)))),
          //                       );
          //                     }).toList(),
          //             ),
          //           )),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: const Color(0xffD9D9D9).withOpacity(0.1),
            height: 7.0.hp, width: 95.0.wp,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              readOnly: true,
              controller: profileController.upincode,
              keyboardType: TextInputType.number,
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
                  hintText: 'Pincode',
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
            height: 30,
          ),
        ],
      );
    });
  }
}
