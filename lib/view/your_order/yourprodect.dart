import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import '../../controller/getorder_controller.dart';

class YourProduct_Details extends StatefulWidget {
  var fetchindex;
  YourProduct_Details({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<YourProduct_Details> createState() => _YourProduct_DetailsState();
}

class _YourProduct_DetailsState extends State<YourProduct_Details> {
  Get_Order_Controller get_order_controller = Get.put(Get_Order_Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.0.wp,
      decoration: BoxDecoration(
          color: const Color(0xffC6C6C6).withOpacity(0.2),
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: const Color(0xffC6C6C6).withOpacity(0.4))),
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
                        get_order_controller
                            .getorderContorller[0]
                            .data!
                            .orderDetails![widget.fetchindex]
                            .materialslist![0]
                            .category
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
                        get_order_controller
                            .getorderContorller[0]
                            .data!
                            .orderDetails![widget.fetchindex]
                            .materialslist![0]
                            .subcategory
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
                SizedBox(
                  child: ListView.builder(
                      itemCount: get_order_controller
                          .getorderContorller[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .materialslist!
                          .length,
                      // type.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = get_order_controller
                            .getorderContorller[0]
                            .data!
                            .orderDetails![widget.fetchindex]
                            .materialslist;
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 31.0.wp,
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 3.0),
                                        child: Text(
                                          data![index]
                                              .material
                                              .toString(), // type[index],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  fontSize: 11.0.sp,
                                                  color:
                                                      const Color(0xff6F6969),
                                                  fontWeight: FontWeight.w500)),
                                        ),
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
                                          Text(
                                            data[index].quantity.toString(),
                                            // quantity[index],
                                            textAlign: TextAlign.center,

                                            style: GoogleFonts.jost(
                                                textStyle: TextStyle(
                                                    fontSize: 11.0.sp,
                                                    color:
                                                        const Color(0xff6F6969),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 29.0.wp,
                                    child: Center(
                                      child: Text(
                                        "RS. ${data[index].price.toString()}",
                                        // price[index],
                                        textAlign: TextAlign.center,

                                        style: GoogleFonts.jost(
                                            textStyle: TextStyle(
                                                fontSize: 11.0.sp,
                                                color: const Color(0xff6F6969),
                                                fontWeight: FontWeight.w500)),
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
                ),
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
                      border: Border.all(color: appcolor, width: 1.5)),
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: 8, bottom: 8),
                  child: Text(
                    "Total = Rs.${get_order_controller.getorderContorller[0].data!.orderDetails![widget.fetchindex].totalPrice.toString()}",
                    style: GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 12.0.sp,
                            color: const Color(0xff5EBDB7),
                            fontWeight: FontWeight.w500)),
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
    );
  }
}
