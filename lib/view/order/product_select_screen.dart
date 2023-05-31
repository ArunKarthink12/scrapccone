import 'dart:developer';

import 'package:http/http.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/fill_details_controller.dart';
import 'package:zero_scarp/controller/subcategory_controller.dart';
import 'package:zero_scarp/controller/withgstcontroller.dart';
import 'package:zero_scarp/controller/withoutgstcontroller.dart';

import '../../controller/addtocartcontroller.dart';
import '../../controller/materialquntity_gst_controller.dart';

import '../../controller/subcategory_type_controller.dart';

class ProductSelectScreen extends StatefulWidget {
  ///for bannerUrl
  var index;

  ///for sub id
  String? subcategoryId;

  ///for sub name
  var subcategoryname;
  ProductSelectScreen(
      {Key? key, this.subcategoryId, this.index, this.subcategoryname})
      : super(key: key);

  @override
  State<ProductSelectScreen> createState() => _ProductSelectScreenState();
}

class _ProductSelectScreenState extends State<ProductSelectScreen> {
  SubCategoryTypeController subCategorytypeController =
      Get.put(SubCategoryTypeController());
  SubCategoryController subCategoryController =
      Get.put(SubCategoryController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  WithGstController withGstController = Get.put(WithGstController());
  WithoutGstController withoutGstController = Get.put(WithoutGstController());
  FillDetailsController fillDetailsController =
      Get.put(FillDetailsController());
  @override
  void initState() {
    subCategorytypeController.subCategorytypeController(
        subCategoryID: widget.subcategoryId.toString());

    // addToCartController.carlist.clear();
    // withoutGstController.withoutgstorder.clear();
    // withGstController.withgstorder.clear();
    super.initState();
  }

  back() {
    Navigator.of(context).pop();
    // Get.to(SubCategoryScreen(
    //   id: subCategoryController.id,
    //   name: subCategoryController.name,
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (subCategorytypeController.subcategorytypeLoad.value == true) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (subCategorytypeController.getsubcategorytype.isEmpty) {
        return const Scaffold(
          body: Center(
            child: Text(
              "Material not found",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        );
      } else {
        return WillPopScope(
          onWillPop: () {
            return back();
          },
          child: Scaffold(
            backgroundColor: const Color(0xff5EBDB7),
            appBar: AppBar(
                elevation: 10,
                backgroundColor: const Color(0xff283736),
                centerTitle: true,
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      // Get.to(SubCategoryScreen(
                      //   id: subCategoryController.id,
                      //   name: subCategoryController.name,
                      // ));
                    },
                    child: Image.asset(
                      'assets/images/back.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: Text(
                  widget.subcategoryname,
                  style: apptitle,
                )),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  ///Banner
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    // height: MediaQuery.of(context).size.height,
                    child: Image.network(
                      subCategorytypeController.getsubcategorytype[0].data!
                          .materialType![widget.index].bannerimageUrl
                          .toString(),
                      fit: BoxFit.cover,
                    ),
                  ),

                  ///material type
                  SelectPaperType(id: widget.subcategoryId.toString()),
                  SizedBox(
                    width: 100.0.wp,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SmallActionButton(
                                press: () {
                                  Navigator.of(context).pop();
                                },
                                elevationvalue: 0,
                                text: 'CANCEL',
                                bordercolor: Colors.white,
                                bgcolor: appcolor,
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 11.0.sp,
                                        letterSpacing: 1.5,
                                        color: screenbackground,
                                        fontWeight: FontWeight.w500)),
                              ),
                              SmallActionButton(
                                press: () {
                                  log('length-->${subCategorytypeController.selectOrderList.length}');
                                  var id = subCategorytypeController
                                      .selectOrderList
                                      .map((item) => item.id)
                                      .toList()
                                      .join(",");

                                  var quantity = subCategorytypeController
                                      .selectOrderList
                                      .map((item) => item.quantity)
                                      .toList()
                                      .join(",");

                                  var prize = subCategorytypeController
                                      .selectOrderList
                                      .map((item) => item.price)
                                      .toList()
                                      .join(",");

                                  var type = subCategorytypeController
                                      .selectOrderList
                                      .map((item) => item.type)
                                      .toList();
                                  log("type-->$type");
                                  log(quantity);
                                  quantity == "0,0,0"
                                      ? Fluttertoast.showToast(
                                          msg: "select quantity")
                                      : addToCartController
                                          .datafetchfromaddtocart(
                                              qnt: quantity, id: id)
                                          .then((value) => {clearandapicall()});

                                  print('this is quty $quantity');
                                  print('this is id $id');
                                  print('this is prize $prize');
                                },
                                elevationvalue: 0,
                                text: 'CONTINUE',
                                bordercolor: const Color(0xff283736),
                                bgcolor: const Color(0xff283736),
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 11.0.sp,
                                        letterSpacing: 1.5,
                                        color: screenbackground,
                                        fontWeight: FontWeight.w500)),
                              )
                            ]),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
          ),
        );
      }
    });
  }

  clearandapicall() {
    fillDetailsController.userName.text = '';
    fillDetailsController.companyName.text = '';
    fillDetailsController.emailid.text = '';
    fillDetailsController.mobileNumber.text = '';
  }
}
