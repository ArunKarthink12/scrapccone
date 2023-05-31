import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/getorder_controller.dart';

import 'getorder.dart';

class YourOrderDetailsSection extends StatefulWidget {
  int fetchindex;
  YourOrderDetailsSection({Key? key, required this.fetchindex})
      : super(key: key);

  @override
  State<YourOrderDetailsSection> createState() =>
      _YourOrderDetailsSectionState();
}

class _YourOrderDetailsSectionState extends State<YourOrderDetailsSection> {
  Get_Order_Controller get_order_controller = Get.put(Get_Order_Controller());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Details',
              style: GoogleFonts.jost(
                  textStyle: TextStyle(
                      fontSize: 14.0.sp,
                      color: const Color(0xff263238),
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 95.0.wp,
          decoration: BoxDecoration(
              color: const Color(0xffC6C6C6).withOpacity(0.2),
              borderRadius: BorderRadius.circular(3),
              border:
                  Border.all(color: const Color(0xffC6C6C6).withOpacity(0.4))),
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
                      fetchvalue: get_order_controller
                          .getorderContorller[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .userName
                          .toString()),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Get_Order_YourDetails(
                      fetchkey: "Company Name",
                      fetchvalue: get_order_controller
                          .getorderContorller[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .companyName
                          .toString()),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Get_Order_YourDetails(
                      fetchkey: "Email ID",
                      fetchvalue: get_order_controller
                          .getorderContorller[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .emailId
                          .toString()),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Get_Order_YourDetails(
                      fetchkey: "Mobile Number",
                      fetchvalue: get_order_controller
                          .getorderContorller[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .mobileNumber
                          .toString()),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Visibility(
                    visible: get_order_controller
                                .getorderContorller[0]
                                .data!
                                .orderDetails![widget.fetchindex]
                                .userDetails!
                                .gstNumber ==
                            null
                        ? false
                        : true,
                    child: Column(
                      children: [
                        Get_Order_YourDetails(
                            fetchkey: "Gst Number",
                            fetchvalue: get_order_controller
                                .getorderContorller[0]
                                .data!
                                .orderDetails![widget.fetchindex]
                                .userDetails!
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
                      fetchvalue: get_order_controller
                          .getorderContorller[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .address
                          .toString()),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Get_Order_YourDetails(
                      fetchkey: "Street",
                      fetchvalue: get_order_controller
                          .getorderContorller[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .street
                          .toString()),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Get_Order_YourDetails(
                      fetchkey: "State",
                      fetchvalue: get_order_controller
                          .getorderContorller[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .state
                          .toString()),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Get_Order_YourDetails(
                      fetchkey: "City",
                      fetchvalue: get_order_controller
                          .getorderContorller[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .city
                          .toString()),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Get_Order_YourDetails(
                      fetchkey: "Pincode",
                      fetchvalue: get_order_controller
                          .getorderContorller[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .pincode
                          .toString()),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Get_Order_YourDetails(
                      fetchkey: "Status",
                      fetchvalue: get_order_controller.getorderContorller[0]
                          .data!.orderDetails![widget.fetchindex].status),
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
    );
  }
}
