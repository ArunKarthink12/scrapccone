///
//////
//////
///////confirmscreen
import '../../allpackages.dart';
import '../../controller/addtocartcontroller.dart';
import '../../controller/fill_details_controller.dart';

class GstConfirmDetail extends StatefulWidget {
  var selectedgst;
  GstConfirmDetail({super.key, this.selectedgst});

  @override
  State<GstConfirmDetail> createState() => _GstConfirmDetailState();
}

class _GstConfirmDetailState extends State<GstConfirmDetail> {
  FillDetailsController fillDetailsController =
      Get.put(FillDetailsController());
  AddToCartController addToCartController = Get.put(AddToCartController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text("OrderId : ",
                    style: GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 11.0.sp,
                            color: const Color(0xff373737),
                            fontWeight: FontWeight.w600)),),
               Text(addToCartController.carlist[0].orderId.toString()),
             ],
           ),
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
                width: 35.00.wp,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "UserName",
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
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
                      fillDetailsController.userName.text,
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
          height: 1.0.hp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: 35.00.wp,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'companyName',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 11.00.sp,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
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
                      fillDetailsController.companyName.text,
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
          height: 1.0.hp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: 35.0.wp,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'email_id',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
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
                      fillDetailsController.emailid.text,
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
          height: 1.0.hp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: 35.0.wp,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'mobileNumber',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
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
                      fillDetailsController.mobileNumber.text,
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
          height: 1.0.hp,
        ),
        Visibility(
          visible: widget.selectedgst == 0 ? true : false,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SizedBox(
                      width: 35.0.wp,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              'gstNumber',
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 11.0.sp,
                                      color: const Color(0xff373737),
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
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
                            fillDetailsController.gstNumber.text,
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
                height: 1.0.hp,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: 35.0.wp,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'address',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
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
                      fillDetailsController.address.text,
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
          height: 1.0.hp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: 35.0.wp,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'street',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
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
                      fillDetailsController.street.text,
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
          height: 1.0.hp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: 35.0.wp,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'state',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
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
                      fillDetailsController.statename.value,
                      // fillDetailsController.state.value,
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
          height: 1.0.hp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: 35.0.wp,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'city',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
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
                      fillDetailsController.cityname.value,
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
          height: 1.0.hp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: 35.0.wp,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'pincode',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 11.0.sp,
                                color: const Color(0xff373737),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
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
                      fillDetailsController.pincode.text,
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
          height: 1.0.hp,
        ),
      ],
    );
  }
}
