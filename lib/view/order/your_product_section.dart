import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import '../../controller/withgstcontroller.dart';
import '../../controller/withoutgstcontroller.dart';

class YourProductSection extends StatefulWidget {
  var selectedgst;
  YourProductSection({Key? key, this.selectedgst}) : super(key: key);

  @override
  State<YourProductSection> createState() => _YourProductSectionState();
}

class _YourProductSectionState extends State<YourProductSection> {
  bool isyourproduct = false;
  WithGstController withGstController = Get.put(WithGstController());
  WithoutGstController withoutGstController = Get.put(WithoutGstController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.0.hp,
        ),
        InkWell(
            onTap: () {
              setState(() {
                isyourproduct = !isyourproduct;
              });
            },
            child: Container(
              height: 5.0.hp,
              width: 95.0.wp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff455A64),
                  border: Border.all(color: const Color(0xff455A64), width: 1)),
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50.0.wp,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(children: [
                            Flexible(
                                child: Text(
                              'Your Product',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 12.0.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30.0.wp,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
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
            )),
        SizedBox(
          height: 0.50.hp,
        ),
        isyourproduct == true
            ? Container(
                width: 95.0.wp,
                decoration: BoxDecoration(
                    color: const Color(0xffC6C6C6).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                        color: const Color(0xffC6C6C6).withOpacity(0.4))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SizedBox(
                            width: 35.0.wp,
                            child: Text(
                              'Category',
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 11.0.sp,
                                      color: const Color(0xff373737),
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                        Text(
                          '-',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 11.0.sp,
                                  color: const Color(0xff373737),
                                  fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: SizedBox(
                            width: 40.0.wp,
                            child: Row(children: [
                              Flexible(
                                child: Text(
                                  withoutGstController.withoutgstorder[0]
                                      .orderDetails![0].category
                                      .toString(),
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 11.0.sp,
                                          color: const Color(0xff6F6969),
                                          fontWeight: FontWeight.w500)),
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
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SizedBox(
                            width: 35.0.wp,
                            child: Text(
                              'Sub-Category',
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 11.0.sp,
                                      color: const Color(0xff373737),
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                        const Text('-'),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: SizedBox(
                            width: 40.0.wp,
                            child: Row(children: [
                              Flexible(
                                child: Text(
                                  withoutGstController.withoutgstorder[0]
                                      .orderDetails![0].subcategory
                                      .toString(),
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 11.0.sp,
                                          color: const Color(0xff6F6969),
                                          fontWeight: FontWeight.w500)),
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
                      width: MediaQuery.of(context).size.width * 0.9,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Type',
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  fontSize: 11.0.sp,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'KG',
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  fontSize: 11.0.sp,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Price',
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  fontSize: 11.0.sp,
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
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 3,
                          ),
                          ListView.builder(
                              itemCount: withoutGstController
                                  .withoutgstorder[0].orderDetails!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var data = withoutGstController
                                    .withoutgstorder[0].orderDetails![index];
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 30.0.wp,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      data.material.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              color: const Color(
                                                                  0xff6F6969),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
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
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      data.quantity.toString(),
                                                      style: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              color: const Color(
                                                                  0xff6F6969),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
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
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      data.price.toString(),
                                                      style: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              fontSize: 11.0.sp,
                                                              color: const Color(
                                                                  0xff6F6969),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 85.0.wp,
                                      color: Colors.grey[300],
                                      height: 0.5,
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            //  height: 7.00.hp,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: appcolor, width: 1.5)),
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, top: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Total = ",
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: const Color(0xff5EBDB7),
                                          fontWeight: FontWeight.w500)),
                                ),
                                Flexible(
                                    child: widget.selectedgst == 0
                                        ? Text(
                                            "Rs. ${withGstController.withgstorder[0].totalPrice}",
                                            style: GoogleFonts.jost(
                                                textStyle: TextStyle(
                                                    fontSize: 12.0.sp,
                                                    color:
                                                        const Color(0xff5EBDB7),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          )
                                        : Text(
                                            "Rs. ${withoutGstController.withoutgstorder[0].totalPrice}",
                                            style: GoogleFonts.jost(
                                                textStyle: TextStyle(
                                                    fontSize: 12.0.sp,
                                                    color:
                                                        const Color(0xff5EBDB7),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ))
                              ],
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
              )
            : Container(),
      ],
    );
  }
}
