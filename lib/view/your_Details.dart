import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../allpackages.dart';
import '../controller/history_controller.dart';

class Your_Order_UI extends StatefulWidget {
  var keyz;
  var fetchdetails;
  Your_Order_UI({super.key, this.keyz, this.fetchdetails});

  @override
  State<Your_Order_UI> createState() => _Your_Order_UIState();
}

class _Your_Order_UIState extends State<Your_Order_UI> {
  History_Controller history_controller = Get.put(History_Controller());

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
                    widget.keyz,
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
                  widget.fetchdetails,
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
    );
  }
}
