// https://zeroscrap.in/api/order_details
// import 'dart:developer';

import 'dart:developer';
import 'dart:io';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/singleorderidbasedcontroller.dart';
import 'package:zero_scarp/view/your_order/getorder.dart';
import 'package:zero_scarp/view/your_order/yourprodect.dart';
// import 'package:zero_scarp/model/getOrder.dart';

import '../../controller/fill_details_controller.dart';
import '../../controller/getorder_controller.dart';
import 'cancelOrderButton.dart';

class Single_Order_Order_base extends StatefulWidget {
  String orderid;
  Single_Order_Order_base({Key? key, required this.orderid}) : super(key: key);

  @override
  State<Single_Order_Order_base> createState() =>
      _Single_Order_Order_baseState();
}

class _Single_Order_Order_baseState extends State<Single_Order_Order_base> {
  var selected;

  SingleorderidbasedController singleorderidbasedController =
      Get.put(SingleorderidbasedController());
  bool isyourproduct = true;
  Get_Order_Controller get_order_controller = Get.put(Get_Order_Controller());

  @override
  void initState() {
    log(widget.orderid);
    singleorderidbasedController.singleorderidbasedcontrollerdatas(
        order_id: widget.orderid);

    // .then((value) {
    //   log(singleorderidbasedController.singleorderdatas.first.message
    //       .toString());
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 10,
            backgroundColor: const Color(0xff283736),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Get.back();
                  // Get.offAll(const HomePage());
                },
                child: Image.asset(
                  'assets/images/back.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            title: Text(
              'Single Order',
              style: apptitle,
            )),
        body: Container(
          child: Obx(() {
            if (singleorderidbasedController.singleorderloading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (singleorderidbasedController
                .singleorderdatas.first.data.orderDetails.isEmpty) {
              return Center(
                child: Text("no data"),
              );
            } else {
              var data = singleorderidbasedController
                  .singleorderdatas.first.data.orderDetails;
              return ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: singleorderidbasedController
                      .singleorderdatas.first.data.orderDetails.length,
                  itemBuilder: (context, index) {
                    var data = singleorderidbasedController
                        .singleorderdatas.first.data.orderDetails;
                    var count = index + 1;
                    // var json = jsonEncode(data);
                    return Column(children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: Center(
                          child: Container(
                            width: 97.0.wp,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 2, color: const Color(0xffF5F5F5)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5, top: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 20, // Image radius
                                        backgroundColor:
                                            const Color(0xffF6F6F6),
                                        child: Text(
                                          count.toString(),
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  fontSize: 9.0.sp,
                                                  color:
                                                      const Color(0xff333333),
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 2),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      // json![index].['materialslist'][0]['subcategory'] ,
                                                      data[index]
                                                          .materialslist[0]
                                                          .subcategory
                                                          .toString(),
                                                      style: notificationtitle,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '27/07/22',
                                                        style: notificationtime,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      selected == index
                                                          ? Image.asset(
                                                              'assets/images/up.png',
                                                              height: 10,
                                                              width: 10,
                                                              color: const Color(
                                                                  0xffAAA9A9),
                                                            )
                                                          : Image.asset(
                                                              'assets/images/down.png',
                                                              height: 10,
                                                              width: 10,
                                                              color: const Color(
                                                                  0xffAAA9A9),
                                                            ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: SizedBox(
                                                height: 2.0.hp,
                                                width: 50.0.wp,
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    // scrollDirection:
                                                    //     Axis.horizontal,
                                                    itemCount:
                                                        singleorderidbasedController
                                                            .singleorderdatas
                                                            .first
                                                            .data
                                                            .orderDetails[0]
                                                            .materialslist
                                                            .length,
                                                    itemBuilder:
                                                        (context, snapshot) {
                                                      var data =
                                                          singleorderidbasedController
                                                              .singleorderdatas
                                                              .first
                                                              .data
                                                              .orderDetails[0]
                                                              .materialslist;
                                                      return
                                                          // Row(
                                                          //   mainAxisAlignment:
                                                          //       MainAxisAlignment.start,
                                                          //   children: [
                                                          //     Flexible(
                                                          //       child:
                                                          SizedBox(
                                                        height: 3.0.hp,
                                                        child: Text(
                                                          "${data[snapshot].materialType},",
                                                          // '''Tamil | English, Magazine, White paper''',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              notificationsubtitle,
                                                        ),
                                                      );
                                                      // ),
                                                      //   ],
                                                      // );
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      // selected == index
                      //     ?
                      //  Column(
                      //     children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              isyourproduct = !isyourproduct;
                              // get_order_controller.orderid = get_order_controller
                              //     .getorderContorller[0]
                              //     .data!
                              //     .orderDetails![widget.fetchindex]
                              //     .orderId
                              //     .toString();
                              // log("OrderID--->${get_order_controller.orderid}");
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 5.0.hp,
                                width: 95.0.wp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff455A64),
                                    border: Border.all(
                                        color: const Color(0xff455A64),
                                        width: 1)),
                                child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 50.0.wp,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Row(children: [
                                              Flexible(
                                                  child: Text(
                                                'Your Product',
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.jost(
                                                    textStyle: TextStyle(
                                                        fontSize: 12.0.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ))
                                            ]),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 30.0.wp,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Image.asset(
                                                        isyourproduct == true
                                                            ? 'assets/images/up.png'
                                                            : 'assets/images/down.png',
                                                        height: 13,
                                                        width: 13,
                                                        color: Colors.white)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(
                                height: 0.50.hp,
                              ),
                              isyourproduct == true
                                  ? Column(
                                      children: [
                                        Container(
                                          width: 95.0.wp,
                                          decoration: BoxDecoration(
                                              color: const Color(0xffC6C6C6)
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              border: Border.all(
                                                  color: const Color(0xffC6C6C6)
                                                      .withOpacity(0.4))),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 2.0.hp,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15.0),
                                                    child: SizedBox(
                                                      width: 35.0.wp,
                                                      child: Text(
                                                        'Category',
                                                        style: GoogleFonts.jost(
                                                            textStyle: TextStyle(
                                                                fontSize:
                                                                    11.0.sp,
                                                                color: const Color(
                                                                    0xff373737),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '-',
                                                    style: GoogleFonts.jost(
                                                        textStyle: TextStyle(
                                                            fontSize: 11.0.sp,
                                                            color: const Color(
                                                                0xff373737),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12.0),
                                                    child: SizedBox(
                                                      width: 40.0.wp,
                                                      child: Row(children: [
                                                        Flexible(
                                                          child: Text(
                                                            data[index]
                                                                .materialslist[
                                                                    0]
                                                                .category
                                                                .toString(),
                                                            style: GoogleFonts.jost(
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        11.0.sp,
                                                                    color: const Color(
                                                                        0xff6F6969),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 2.0.hp,
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15.0),
                                                    child: SizedBox(
                                                      width: 35.0.wp,
                                                      child: Text(
                                                        'Sub-Category',
                                                        style: GoogleFonts.jost(
                                                            textStyle: TextStyle(
                                                                fontSize:
                                                                    11.0.sp,
                                                                color: const Color(
                                                                    0xff373737),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ),
                                                    ),
                                                  ),
                                                  const Text('-'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12.0),
                                                    child: SizedBox(
                                                      width: 40.0.wp,
                                                      child: Row(children: [
                                                        Flexible(
                                                          child: Text(
                                                            data[index]
                                                                .materialslist[
                                                                    0]
                                                                .subcategory
                                                                .toString(),
                                                            style: GoogleFonts.jost(
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        11.0.sp,
                                                                    color: const Color(
                                                                        0xff6F6969),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 2.0.hp,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                color: const Color(0xff6A7B83),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 1.0.hp,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 30.0.wp,
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    'Type',
                                                                    style: GoogleFonts.jost(
                                                                        textStyle: TextStyle(
                                                                            fontSize:
                                                                                11.0.sp,
                                                                            color: Colors.white,
                                                                            fontWeight: FontWeight.w500)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 30.0.wp,
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    'KG',
                                                                    style: GoogleFonts.jost(
                                                                        textStyle: TextStyle(
                                                                            fontSize:
                                                                                11.0.sp,
                                                                            color: Colors.white,
                                                                            fontWeight: FontWeight.w500)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 30.0.wp,
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    'Price',
                                                                    style: GoogleFonts.jost(
                                                                        textStyle: TextStyle(
                                                                            fontSize:
                                                                                11.0.sp,
                                                                            color: Colors.white,
                                                                            fontWeight: FontWeight.w500)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 1.0.hp,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    SizedBox(
                                                      child: ListView.builder(
                                                          itemCount: data[index]
                                                              .materialslist
                                                              .length,
                                                          // type.length,
                                                          shrinkWrap: true,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          itemBuilder: (context,
                                                              snapshot) {
                                                            var datazz = data[
                                                                    index]
                                                                .materialslist;
                                                            return Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 8.0,
                                                                      bottom:
                                                                          8),
                                                                  child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width: 31.0
                                                                            .wp,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 3.0),
                                                                            child:
                                                                                Text(
                                                                              datazz[snapshot].material.toString(), // type[index],
                                                                              textAlign: TextAlign.center,
                                                                              style: GoogleFonts.jost(textStyle: TextStyle(fontSize: 11.0.sp, color: const Color(0xff6F6969), fontWeight: FontWeight.w500)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 30.0
                                                                            .wp,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                datazz[snapshot].quantity.toString(),
                                                                                // quantity[index],
                                                                                textAlign: TextAlign.center,

                                                                                style: GoogleFonts.jost(textStyle: TextStyle(fontSize: 11.0.sp, color: const Color(0xff6F6969), fontWeight: FontWeight.w500)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 29.0
                                                                            .wp,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            "RS. ${datazz[snapshot].price.toString()}",
                                                                            // price[index],
                                                                            textAlign:
                                                                                TextAlign.center,

                                                                            style:
                                                                                GoogleFonts.jost(textStyle: TextStyle(fontSize: 11.0.sp, color: const Color(0xff6F6969), fontWeight: FontWeight.w500)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width:
                                                                      85.0.wp,
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                  height: 0.5,
                                                                ),
                                                              ],
                                                            );
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 14,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Container(
                                                      //  height: 7.00.hp,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: appcolor,
                                                              width: 1.5)),
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 18,
                                                              right: 18,
                                                              top: 8,
                                                              bottom: 8),
                                                      child: Text(
                                                        "Total = Rs.${data[index].totalPrice.toString()}",
                                                        style: GoogleFonts.jost(
                                                            textStyle: TextStyle(
                                                                fontSize:
                                                                    12.0.sp,
                                                                color: const Color(
                                                                    0xff5EBDB7),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        // YourProduct_Details(
                                        //   fetchindex: index,
                                        // ),
                                        SizedBox(
                                            height: 31.0.hp,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                20,
                                            // decoration: BoxDecoration(
                                            //     image: DecorationImage(
                                            //         image: NetworkImage(history_controller
                                            //             .historycontrollerList[0]
                                            //             .data!
                                            //             .orderDetails![index]
                                            //             .image
                                            //             .toString()))
                                            // ),
                                            child: Image.network(
                                                data[index].image.toString(),
                                                fit: BoxFit.cover)),
                                        const SizedBox(
                                          height: 15,
                                        ),

                                        ///ordermodelcmnt
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Your Details',
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          fontSize: 14.0.sp,
                                                          color: const Color(
                                                              0xff263238),
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              width: 95.0.wp,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffC6C6C6)
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  border: Border.all(
                                                      color: const Color(
                                                              0xffC6C6C6)
                                                          .withOpacity(0.4))),
                                              child: Column(
                                                children: [
                                                  // ListView.builder(
                                                  //     itemCount: get_order_controller
                                                  //         .getorderContorller[0].data!.orderDetails!.length,
                                                  //     // detailsnames.length,
                                                  //     shrinkWrap: true,
                                                  //     physics: const NeverScrollableScrollPhysics(),
                                                  //     itemBuilder: (context, index) {
                                                  //       return
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 2.0.hp,
                                                      ),
                                                      Get_Order_YourDetails(
                                                          fetchkey: "Name",
                                                          fetchvalue:
                                                              data[index]
                                                                  .userDetails
                                                                  .userName
                                                                  .toString()),
                                                      SizedBox(
                                                        height: 2.0.hp,
                                                      ),
                                                      Get_Order_YourDetails(
                                                          fetchkey:
                                                              "Company Name",
                                                          fetchvalue:
                                                              data[index]
                                                                  .userDetails
                                                                  .companyName
                                                                  .toString()),
                                                      SizedBox(
                                                        height: 2.0.hp,
                                                      ),
                                                      Get_Order_YourDetails(
                                                          fetchkey: "Email ID",
                                                          fetchvalue:
                                                              data[index]
                                                                  .userDetails
                                                                  .emailId
                                                                  .toString()),
                                                      SizedBox(
                                                        height: 2.0.hp,
                                                      ),
                                                      Get_Order_YourDetails(
                                                          fetchkey:
                                                              "Mobile Number",
                                                          fetchvalue:
                                                              data[index]
                                                                  .userDetails
                                                                  .mobileNumber
                                                                  .toString()),
                                                      SizedBox(
                                                        height: 2.0.hp,
                                                      ),
                                                      Visibility(
                                                        visible: data[index]
                                                                    .userDetails
                                                                    .gstNumber ==
                                                                null
                                                            ? false
                                                            : true,
                                                        child: Column(
                                                          children: [
                                                            Get_Order_YourDetails(
                                                                fetchkey:
                                                                    "Gst Number",
                                                                fetchvalue: data[
                                                                        index]
                                                                    .userDetails
                                                                    .gstNumber
                                                                    .toString()),
                                                            SizedBox(
                                                              height: 2.0.hp,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Get_Order_YourDetails(
                                                          fetchkey: "Address",
                                                          fetchvalue:
                                                              data[index]
                                                                  .userDetails
                                                                  .address
                                                                  .toString()),
                                                      SizedBox(
                                                        height: 2.0.hp,
                                                      ),
                                                      Get_Order_YourDetails(
                                                          fetchkey: "Street",
                                                          fetchvalue:
                                                              data[index]
                                                                  .userDetails
                                                                  .street
                                                                  .toString()),
                                                      SizedBox(
                                                        height: 2.0.hp,
                                                      ),
                                                      Get_Order_YourDetails(
                                                          fetchkey: "State",
                                                          fetchvalue:
                                                              data[index]
                                                                  .userDetails
                                                                  .state
                                                                  .toString()),
                                                      SizedBox(
                                                        height: 2.0.hp,
                                                      ),
                                                      Get_Order_YourDetails(
                                                          fetchkey: "City",
                                                          fetchvalue:
                                                              data[index]
                                                                  .userDetails
                                                                  .city
                                                                  .toString()),
                                                      SizedBox(
                                                        height: 2.0.hp,
                                                      ),
                                                      Get_Order_YourDetails(
                                                          fetchkey: "Pincode",
                                                          fetchvalue:
                                                              data[index]
                                                                  .userDetails
                                                                  .pincode
                                                                  .toString()),
                                                      SizedBox(
                                                        height: 2.0.hp,
                                                      ),
                                                      Get_Order_YourDetails(
                                                          fetchkey: "Status",
                                                          fetchvalue:
                                                              data[index]
                                                                  .status),
                                                    ],
                                                  ),
                                                  // }),
                                                  SizedBox(
                                                    height: 3.0.hp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),

                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Visibility(
                                          visible:
                                              data[index].orderCancel == "true"
                                                  ? false
                                                  : true,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.065,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff283736),
                                                      border: Border.all(
                                                        color: const Color(
                                                            0xff283736),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      get_order_controller
                                                              .orderid =
                                                          data[index]
                                                              .orderId
                                                              .toString();
                                                      // log(get_order_controller.orderid);
                                                      cancelreceivedorderBottomSheet(
                                                          context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: const Color(
                                                          0xff283736),
                                                      elevation: 0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      textStyle: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              letterSpacing:
                                                                  1.5,
                                                              color:
                                                                  screenbackground,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                    child: Text(
                                                      'CANCEL ORDER',
                                                      style: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              color:
                                                                  screenbackground,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ))
                    ]);
                  });
            }
          }),
        ));
  }

  cancelreceivedorderBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        builder: (context) {
          // get_order_controller.additionalComment.text = '';
          return CancelOrder(
            fetchOrderID: get_order_controller.orderid,
          );
        });
  }
}
