// import 'dart:developer';
// import 'dart:math';

import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/addtocartcontroller.dart';
import 'package:zero_scarp/controller/servicecontroller.dart';
import 'package:zero_scarp/controller/subcategory_controller.dart';

class SubCategoryList extends StatefulWidget {
  const SubCategoryList({Key? key}) : super(key: key);

  @override
  State<SubCategoryList> createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
  SubCategoryController subCategoryController =
      Get.put(SubCategoryController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  ServiceController serviceController = Get.put(ServiceController());
  String? localadministrativearea;
  fun(title, content) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          itemCount:
              subCategoryController.getsubcategory[0].data!.subcategory!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var data = subCategoryController
                .getsubcategory[0].data!.subcategory![index];
            return Column(
              children: [
                SizedBox(
                  height: 2.0.hp,
                ),
                InkWell(
                  onTap: () async {
                    // subCategoryController.area.toLowerCase();
                    addToCartController.subid = data.subcategoryId.toString();

                    addToCartController.subindex = index;
                    addToCartController.subtitle =
                        data.subcategoryName.toString();

                    var ids = data.subcategoryId.toString();

                    bool serviceEnabled;
                    LocationPermission permission;

                    // Test if location services are enabled.
                    serviceEnabled =
                        await Geolocator.isLocationServiceEnabled();

                    if (serviceEnabled) {
                      await Geolocator.requestPermission();
                      Position position = await Geolocator.getCurrentPosition(
                          forceAndroidLocationManager: false,
                          desiredAccuracy: LocationAccuracy.best);
                      debugPrint('location: ${position.latitude}');
                      List<Placemark> addresses =
                          await placemarkFromCoordinates(
                              position.latitude, position.longitude);
                      var first = addresses.first;
                      log(first.toString());
                      setState(() {
                        subCategoryController.locationarea =
                            first.subLocality!.toLowerCase();
                        subCategoryController.localitylocationarea =
                            first.locality!.toLowerCase();
                        // localitylocationarea
                      });
                      if (subCategoryController.area ==
                          subCategoryController.locationarea) {
                        Get.to(ProductSelectScreen(
                            subcategoryname: data.subcategoryName.toString(),
                            index: index,
                            subcategoryId: ids));
                      } else if (subCategoryController.area ==
                          subCategoryController.localitylocationarea) {
                        Get.to(ProductSelectScreen(
                            subcategoryname: data.subcategoryName.toString(),
                            index: index,
                            subcategoryId: ids));
                      } else {
                        areaLocation();
                      }
                    } else {
                      leavePOPup();
                    }
                    permission = await Geolocator.requestPermission();
                    if (permission == LocationPermission.denied) {
                      permission = await Geolocator.requestPermission();
                      if (permission == LocationPermission.deniedForever) {
                        fun('Location',
                            'No location Permission in this app Go to Settings to Turn On Location');
                        await Geolocator.openAppSettings();
                        if (permission ==
                            LocationPermission.unableToDetermine) {
                          fun('Location',
                              'No location Permission in this app Go to Settings to Turn On Location');
                        }
                      }
                    }
                    log("fetch");
                    log(subCategoryController.area);
                    log("current");
                    log(subCategoryController.locationarea);

                    setState(() {});
                  },
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.97,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xffFFFFFF),
                          border: Border.all(
                            color: const Color(0xffFFFFFF),
                          )),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.hp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey.shade200,
                                      radius: 30.0.sp,
                                      backgroundImage:
                                          NetworkImage(data.subcategoryImage!),
                                    ),
                                    Container(
                                      width: 60.0.wp,
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              data.subcategoryName.toString(),
                                              textAlign: TextAlign.center,
                                              style: listtitle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/images/right.png',
                                      height: 14, width: 14),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.0.hp,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  leavePOPup() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              insetPadding: EdgeInsets.only(
                  top: 8.0.sp, bottom: 8.0, left: 5.0, right: 5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: SizedBox(
                height: 44.5.hp,
                child: Column(
                  children: [
                    Stack(children: [
                      Image.asset(
                        "assets/images/your_location.gif",
                        height: 33.0.hp,
                        // 194,
                        width: 88.0.wp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.0.wp,
                          left: 79.0.wp,
                          bottom: 56.0.wp,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              "assets/images/Vector_1.png", height: 3.0.hp,
                              // 194,
                            )),
                      ),
                    ]),
                    Text(
                      'Turn on your location...',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 11.0.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0.sp),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(98, 35), //////// HERE
                        ),
                        onPressed: () => Navigator.of(context).pop(false),
                        //return true when click on "Yes"
                        child: Text(
                          'Okay',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        //  errorDialog
        );
  }

  areaLocation() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              insetPadding: EdgeInsets.only(
                  top: 8.0.sp, bottom: 8.0, left: 5.0, right: 5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: SizedBox(
                height: 46.5.hp,
                child: Column(
                  children: [
                    Stack(children: [
                      Image.asset(
                        "assets/images/Animation.gif",
                        height: 33.0.hp,
                        // 194,
                        width: 88.0.wp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.0.wp,
                          left: 79.0.wp,
                          bottom: 56.0.wp,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              "assets/images/Vector_1.png", height: 3.0.hp,
                              // 194,
                            )),
                      ),
                    ]),
                    Text(
                      textAlign: TextAlign.center,
                      'Service is not available for this\nlocation...',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 11.0.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0.sp),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(98, 35), //////// HERE
                        ),
                        onPressed: () => Navigator.of(context).pop(false),
                        //return true when click on "Yes"
                        child: Text(
                          'Okay',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        //  errorDialog
        );
  }
}
