// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'dart:developer';

import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/fill_details_controller.dart';
import 'package:zero_scarp/controller/multiaddresslistcontroller.dart';

import 'editaddress.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  MultiaddressController multiaddressController =
      Get.put(MultiaddressController());
  FillDetailsController fillDetailsController =
      Get.put(FillDetailsController());
  // String? address;
  var selectedaddress;
  @override
  void initState() {
    multiaddressController.multiaddresscontrollerdatas();
    // TODO: implement initState
    super.initState();
  }

  back() {
    // Get.delete<MultiaddressController>();
    Get.back();
    // return Get.to(const DetailsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        //  const Color(0xff5EBDB7),
        appBar: AppBar(
            elevation: 10,
            backgroundColor: const Color(0xff283736),
            // centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  'assets/images/back.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            title: Text(
              'Delivery Address',
              style: apptitle,
            )),
        body: Column(
          children: [
            Obx(() {
              if (multiaddressController.multiaddressloading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (multiaddressController
                  .multiaddressdatas.first.data.isEmpty) {
                return const Center(
                  child: Text("No Address added"),
                );
              } else {
                return Center(
                    child: Column(
                  children: [
                    // _listviewer(datas),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    SizedBox(
                      width: 90.0.wp,
                      height: 69.0.hp,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 3.5.hp,
                          );
                        },
                        itemCount: multiaddressController
                            .multiaddressdatas.first.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var datum = multiaddressController.multiaddressdatas;
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 26.4.hp,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF3F3F3),
                                  borderRadius: BorderRadius.circular(5.0.sp),
                                  border: Border.all(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.3))),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedaddress = index;
                                      });
                                      fillDetailsController
                                          .selectaddressindex.value = index;
                                      log(fillDetailsController
                                          .selectaddressindex
                                          .toString());
                                      fillDetailsController.address.text =
                                          datum.first.data[index].address;
                                      fillDetailsController.street.text =
                                          datum.first.data[index].street;
                                      fillDetailsController.state.value =
                                          datum.first.data[index].stateId;
                                      fillDetailsController.statename.value =
                                          datum.first.data[index].state;
                                      fillDetailsController.city.value =
                                          datum.first.data[index].cityId;
                                      fillDetailsController.cityname.value =
                                          datum.first.data[index].city;
                                      fillDetailsController.pincode.text =
                                          datum.first.data[index].pincode;

                                      Get.back();
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 6.0.wp,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.all(8.0.sp),
                                              child: RichText(
                                                text: TextSpan(
                                                  text:
                                                      "${datum.first.data[index].address}\n",
                                                  style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10.0.sp,
                                                      height: 1.9,
                                                      color: Color(0xffA3A3A3)),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            "${datum.first.data[index].street}\n",
                                                        style: GoogleFonts.roboto(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 10.0.sp,
                                                            height: 1.9,
                                                            color: Color(
                                                                0xffA3A3A3))),
                                                    TextSpan(
                                                        text: "${datum.first.data[index].city}, " +
                                                            '${datum.first.data[index].state}\n',
                                                        style: GoogleFonts.roboto(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 10.0.sp,
                                                            height: 1.9,
                                                            color: Color(
                                                                0xffA3A3A3))),
                                                    TextSpan(
                                                        text:
                                                            'Pincode - ${datum.first.data[index].pincode}\n',
                                                        style: GoogleFonts.roboto(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 10.0.sp,
                                                            height: 1.9,
                                                            color: Color(
                                                                0xffA3A3A3))),
                                                  ],
                                                ),
                                              )),
                                          const Expanded(child: SizedBox()),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 5.0.sp),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  width: 5.9.wp,
                                                  height: 2.8.hp,
                                                  alignment: Alignment.center,
                                                  decoration:
                                                      const BoxDecoration(
                                                    gradient:
                                                        LinearGradient(colors: [
                                                      Color(0xff5C5C5C),
                                                      Color(0xff292929),
                                                    ]),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 5,
                                                  child: Container(
                                                    width: 2.0.wp,
                                                    height: 2.8.hp,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            selectedaddress ==
                                                                    index
                                                                ? appcolor1
                                                                : Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.0.wp,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: const Color(0xffC6C6C6)
                                        .withOpacity(0.3),
                                    thickness: 2,
                                    endIndent: 10,
                                    indent: 10,
                                  ),
                                  edit(
                                      cityname: datum.first.data[index].city,
                                      statename: datum.first.data[index].state,
                                      address: datum.first.data[index].address,
                                      state: datum.first.data[index].stateId,
                                      city: datum.first.data[index].cityId,
                                      pincode: datum.first.data[index].pincode,
                                      street: datum.first.data[index].street,
                                      addressid: datum
                                          .first.data[index].addressId
                                          .toString())
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.0.hp,
                    ),
                  ],
                ));
              }
            }),
            multibutton()
          ],
        ),
      ),
    );
  }

  Widget multibutton() {
    return GestureDetector(
      onTap: () {
        fillDetailsController.address.clear();
        fillDetailsController.city.value = '';
        fillDetailsController.pincode.clear();
        fillDetailsController.state.value = '';
        fillDetailsController.street.clear();
        Get.to(MultiUsageScreenEditUpdate(
          button: "Save address",
          title: "Add address",
        ));
      },
      child: Container(
        height: 6.0.hp,
        width: MediaQuery.of(context).size.width - 10.0.wp,
        color: const Color(0xff283736),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              "Add another address",
              style: GoogleFonts.jost(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget edit(
      {statename, cityname, address, street, state, city, pincode, addressid}) {
    return GestureDetector(
      onTap: () {
        fillDetailsController.address.text = address;
        fillDetailsController.state.value = state;
        fillDetailsController.statename.value = statename;
        fillDetailsController.city.value = city;
        fillDetailsController.cityname.value = cityname;
        fillDetailsController.pincode.text = pincode;
        fillDetailsController.street.text = street;
        Get.to(MultiUsageScreenEditUpdate(
          addressid: addressid,
          button: "Update address",
          title: "Edit address",
        ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 25.0.sp),
        // color: Colors.amberAccent,
        child: Row(
          children: [
            Text(
              "Edit",
              style: GoogleFonts.roboto(
                  color: const Color(0xff283736), fontWeight: FontWeight.w500),
            ),
            const Icon(Icons.keyboard_arrow_right_outlined)
          ],
        ),
      ),
    );
  }
}
