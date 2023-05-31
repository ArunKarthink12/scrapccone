// import 'dart:developer';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../allpackages.dart';
// import '../../controller/subcategory_type_controller.dart';
// import 'gridmaterialtype.dart';

// class GridItem_List extends StatefulWidget {
//   var index;
//   var selectedindex;
 
//   var gridIndex;
//   GridItem_List(
//       {super.key,  , this.gridIndex, this.index, this.selectedindex});

//   @override
//   State<GridItem_List> createState() => _GridItem_ListState();
// }

// class _GridItem_ListState extends State<GridItem_List> {
//   SubCategoryTypeController subCategorytypeController =
//       Get.put(SubCategoryTypeController());
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       width: 300,
//       child: GridView.builder(
//           itemCount: subCategorytypeController.getsubcategorytype[0].data!
//               .materialType![widget.index].materialSubtype!.length,
//           itemBuilder: ((context, index1) {
//             var griditem = subCategorytypeController.getsubcategorytype[0].data!
//                 .materialType![widget.index].materialSubtype![index1];
//             log("PrizeAmount--->${griditem.price}");
//             return Column(
//               children: [
//                 InkWell(
//                     /*       onTap: () {
//                                                     setState(() {
//                                                       gridIndex = index1;
//                                                       // selectedindex ==
//                                                       //     language[data];
//                                                       log(gridIndex
//                                                           .toString());
//                                                       log(griditem
//                                                           .materialSubtype![
//                                                               index1]
//                                                           .type!
//                                                           .toString());
//                                                       var e = griditem
//                                                           .materialSubtype![
//                                                               0]
//                                                           .type!;
//                                                       if (e ==
//                                                           'English') {
//                                                         store = griditem
//                                                             .materialSubtype![
//                                                                 index1]
//                                                             .price
//                                                             .toString();

//                                                         print(
//                                                             'storee--${store}');
//                                                       } else if (e ==
//                                                           'Tamil') {
//                                                         store = griditem
//                                                             .materialSubtype![
//                                                                 index1]
//                                                             .price!
//                                                             .toString();
//                                                         print(
//                                                             'storee--${store}');
//                                                       }

//                                                       // selectedindex = index;
//                                                     });
//                                                   },
                                                     
//                                                 */
//                     onTap: () {
//                       setState(() {
//                         // selectedindex = index;
//                         widget.gridIndex = index1;
//                       });
//                       subCategorytypeController.subCategoryList[widget.index] =
//                           griditem.price;

//                       log("prize--->${subCategorytypeController.subCategoryList}");
//                       log("gridindex--->${widget.gridIndex}");
//                       log("index--->${widget.selectedindex}");
//                     },
//                     child: MaterialType_GridItem(
//                       index: widget.index,
//                       selectedindex: widget.selectedindex,
//                       data: griditem[].materialSubtype![index1].type!.toString(),
//                       gridIndex: widget.gridIndex,
//                       index1: index1,
//                     )),

//                 ////
//               ],
//             );
//           }),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//           )),
//     );
//   }
// }
