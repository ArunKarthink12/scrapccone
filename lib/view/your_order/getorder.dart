import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../allpackages.dart';
import '../../controller/getorder_controller.dart';

class Get_Order_YourDetails extends StatefulWidget {
  var fetchkey;
  var fetchvalue;
  final bool status;

  Get_Order_YourDetails(
      {super.key, this.fetchkey, this.fetchvalue, this.status = false});

  @override
  State<Get_Order_YourDetails> createState() => _Get_Order_YourDetailsState();
}

class _Get_Order_YourDetailsState extends State<Get_Order_YourDetails> {
  Get_Order_Controller get_order_controller = Get.put(Get_Order_Controller());

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    widget.fetchkey,
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
                  widget.fetchvalue,
                  style: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontSize: 11.0.sp,
                          color: widget.status
                              ? widget.fetchvalue == "Paid" ||
                                      widget.fetchvalue == "Completed"
                                  ? Colors.green
                                  : widget.fetchvalue == "Cancelled"
                                      ? Colors.red
                                      : const Color(0xff6F6969)
                              : const Color(0xff6F6969),
                          fontWeight: FontWeight.w500)),
                ),
              )
            ]),
          ),
        )
      ],
    );
  }
}
