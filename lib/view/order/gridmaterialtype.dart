import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../allpackages.dart';

class MaterialType_GridItem extends StatefulWidget {
  var data;
  var index1;
  var gridIndex;
  var selectedindex;
  var index;
  var colorCondition;
  MaterialType_GridItem(
      {super.key,
      this.data,
      this.gridIndex,
      this.index1,
      this.index,
      this.colorCondition,
      this.selectedindex});

  @override
  State<MaterialType_GridItem> createState() => _MaterialType_GridItemState();
}

class _MaterialType_GridItemState extends State<MaterialType_GridItem> {
  @override
  Widget build(BuildContext context) {
    print('index color ${widget.index1} / ${widget.colorCondition}');
    return Container(
        decoration: BoxDecoration(
            color: widget.colorCondition == widget.index1
                ? appcolor
                : Colors.black45,
            borderRadius: BorderRadius.circular(3)),
        padding: const EdgeInsets.only(top: 7, bottom: 7, left: 23, right: 23),
        child: Text(
          // griditem
          //     .materialSubtype![
          //         index1]
          widget.data,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 10.0.sp,
                  color:
                      //  selectlanguage == 0
                      // ?
                      Colors.white,
                  // : const Color(
                  //     0xff848484),
                  fontWeight: FontWeight.w500)),
        ));
  }
}
