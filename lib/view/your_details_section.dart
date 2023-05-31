import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/fill_details_controller.dart';

import '../controller/history_controller.dart';
import 'your_Details.dart';

class YourDetails extends StatefulWidget {
  var fetchindex;
  YourDetails({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<YourDetails> createState() => _YourDetailsState();
}

class _YourDetailsState extends State<YourDetails> {
  History_Controller history_controller = Get.put(History_Controller());
  FillDetailsController fillDetailsController =
      Get.put(FillDetailsController());
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
              Column(
                children: [
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Your_Order_UI(
                      fetchdetails:
                          // fillDetailsController.Uname.value.toString(),

                          history_controller
                              .historycontrollerList[0]
                              .data!
                              .orderDetails![widget.fetchindex]
                              .userDetails!
                              .userName
                              .toString(),
                      keyz: "Name"),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Your_Order_UI(
                      fetchdetails: history_controller
                          .historycontrollerList[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .companyName
                          .toString(),
                      keyz: "Company Name"),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Your_Order_UI(
                      fetchdetails: history_controller
                          .historycontrollerList[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .emailId
                          .toString(),
                      keyz: "Email ID"),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Your_Order_UI(
                      fetchdetails: history_controller
                          .historycontrollerList[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .mobileNumber
                          .toString(),
                      keyz: "Mobile Number"),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Visibility(
                    visible: history_controller
                                .historycontrollerList[0]
                                .data!
                                .orderDetails![widget.fetchindex]
                                .userDetails!
                                .gstNumber ==
                            null
                        ? false
                        : true,
                    child: Column(
                      children: [
                        Your_Order_UI(
                            fetchdetails: history_controller
                                .historycontrollerList[0]
                                .data!
                                .orderDetails![widget.fetchindex]
                                .userDetails!
                                .gstNumber
                                .toString(),
                            keyz: "GST Number"),
                        SizedBox(
                          height: 2.0.hp,
                        ),
                      ],
                    ),
                  ),
                  Your_Order_UI(
                      fetchdetails: history_controller
                          .historycontrollerList[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .address
                          .toString(),
                      keyz: "Address"),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Your_Order_UI(
                      fetchdetails: history_controller
                          .historycontrollerList[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .state
                          .toString(),
                      keyz: "State"),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Your_Order_UI(
                      fetchdetails: history_controller
                          .historycontrollerList[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .city
                          .toString(),
                      keyz: "City"),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Your_Order_UI(
                      fetchdetails: history_controller
                          .historycontrollerList[0]
                          .data!
                          .orderDetails![widget.fetchindex]
                          .userDetails!
                          .pincode
                          .toString(),
                      keyz: "Pincode"),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  // Your_Order_UI(
                  //     fetchdetails: history_controller
                  //         .historycontrollerList[0]
                  //         .data!
                  //         .orderDetails![widget.fetchindex]
                  //         .userDetails!
                  //         . s
                  //         .toString(),
                  //     keyz: "Status"),
                  //       SizedBox(
                  //   height: 1.0.hp,
                  // ),
                ],
              ),
              SizedBox(
                height: 4.0.hp,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
