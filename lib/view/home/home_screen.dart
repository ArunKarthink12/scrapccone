import 'dart:developer';
import 'dart:io';

import 'package:marquee/marquee.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/model/category_response.dart';

import '../../controller/category_controller.dart';
import '../../controller/getProfile_controller.dart';
import '../../controller/homescreen_controller.dart';
import '../../controller/servicecontroller.dart';
import '../livelocation/area.dart';

import '../painting/painting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LoginController loginController = Get.put(LoginController());
  CategoryController categoryController = Get.put(CategoryController());

  HomeScreen_separate_Controller homeScreen_separate_Controller =
      Get.put(HomeScreen_separate_Controller());
  ProfileController profileController = Get.put(ProfileController());
  ServiceController serviceController = Get.put(ServiceController());

  @override
  void initState() {
    shared();
    fetchData();

    print(" sddfggh${Urls.appUpdate}");
    super.initState();
  }

  var area;
  shared() async {
    await profileController.profileController().then((value) {
      var data = profileController.getProfilemodel[0].data!;
      profileController.editprofileimage = data.profilePicture ?? '';
    });

    profileController.profileimage = File('');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    log('token');
    log(sharedPreferences.getString(Constants.authToken).toString());

    homeScreen_separate_Controller.homecontroller();
    profileController.profileusername =
        sharedPreferences.getString(Constants.userName);
    area = sharedPreferences.getString(Constants.area);
    log("images-->${profileController.editprofileimage}");
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await categoryController.categoryController();
    });
  }

  // _onItemTapped(int index) {
  //   profileController.selectedIndex.value = index;
  //   Get.forceAppUpdate();
  // }

  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Double Tap to Exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      return onWillPop();
    }, child: Obx(() {
      if (categoryController.categoryLoad.value ||
          profileController.isProfileLoad.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (categoryController.getcategory.isEmpty) {
        return const Center(
          child: Text('No Data Found'),
        );
      } else {
        return SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: const Size(100, 70),
                child: SizedBox(
                  height: 60,
                  width: 100.0.wp,
                  child: Stack(
                    children: [
                      Container(
                        height: 60,
                        width: 100.0.wp,
                        color: const Color(0xff283736),
                      ),
                      Image.asset(
                        'assets/images/bg.png',
                        height: 60,
                        width: 100.0.wp,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 50.0.hp,
                        width: 100.0.wp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 6.5.hp,
                              width: 35.0.wp,
                              child: Image.asset(
                                'assets/img/logo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: 2.0.wp,
                            ),
                            GestureDetector(
                              onTap: () {
                                log("Use this plugin \ngoogle_maps_place_picker_mb: ^2.0.0-mb.22");

                                Get.to(CityScreen());
                              },
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      profileController.locationarea.value
                                          .toString(),
                                      style: location,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showMenu<String>(
                                  context: context,
                                  position: const RelativeRect.fromLTRB(
                                      25.0, 25.0, 0.0, 0.0),
                                  items: [
                                    const PopupMenuItem<String>(
                                        value: '1', child: Text('Profile')),
                                    const PopupMenuItem<String>(
                                        value: '2', child: Text('LogOut')),
                                  ],
                                  elevation: 8.0,
                                ).then<void>((String? itemSelected) {
                                  if (itemSelected == null) return;

                                  if (itemSelected == "1") {
                                    Get.to(() => const EditProfileScreen());
                                  } else if (itemSelected == "2") {
                                    loginController.logout();
                                  } else {}
                                });
                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 9),
                                  child: profileController.getProfilemodel[0]
                                              .data!.profilePicture ==
                                          ''
                                      ? Image.asset(
                                          'assets/images/people1.png',
                                          height: 25,
                                          width: 25,
                                        )
                                      : Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      profileController
                                                          .getProfilemodel[0]
                                                          .data!
                                                          .profilePicture
                                                          .toString())),
                                              shape: BoxShape.circle),
                                        )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              body: SafeArea(
                  child: RefreshIndicator(
                strokeWidth: 3,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: () async {
                  await categoryController.categoryController();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: const Color(0xff283736),
                        child: Row(
                          children: [
                            Flexible(flex: 3, child: todaysprize()),
                            Flexible(
                              flex: 5,
                              child: SizedBox(
                                  height: 6.0.hp,
                                  child:
                                      // ListView.builder(
                                      //     shrinkWrap: true,
                                      //     itemCount: 1,
                                      //     itemBuilder: (context, index) {
                                      //       log(">$index");

                                      //       categoryController
                                      //           .getcategory[0].data!.materials!
                                      //           .forEach((element) {
                                      //         // log("runn->${categoryController.name}");
                                      //       });

                                      //       return
                                      categoryController.getcategory[0].data!
                                              .materials!.isEmpty
                                          ? Padding(
                                              padding: EdgeInsets.all(.1.sp),
                                              child: Container(
                                                height: 6.0.hp,
                                                color: Color.fromARGB(
                                                    0, 101, 7, 7),
                                              ))
                                          : Padding(
                                              padding: EdgeInsets.all(.1.sp),
                                              child: Container(
                                                  height: 6.0.hp,
                                                  color: Colors.transparent,
                                                  child: buildMarquee()))
                                  // }),
                                  ),
                            )
                          ],
                        ),
                      ),
                      const ImageSliderHome(),
                      // SizedBox(
                      //   height: .5.hp,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100.0.wp,
                          height: 10.0.hp,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('assets/images/category2.png'),
                            ),
                          ),
                        ),
                      ),
                      CategoryList(),
                      SizedBox(
                        height: 4.0.hp,
                      ),
                    ],
                  ),
                ),
              ))),
        );
      }
    }));
  }

  Widget todaysprize() {
    return SizedBox(
      height: 6.0.hp,
      width: 36.0.wp,
      child: CustomPaint(
        painter: PriceTagPaint(),
        child: Align(
          alignment: const Alignment(-0.3, -.1),
          child: Text(
            "Today’s price",
            style: GoogleFonts.jost(
                textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }

  // Widget _wrapWithStuff(Widget child) {
  //   return Padding(
  //     padding: EdgeInsets.all(.1.sp),
  //     child: Container(height: 6.0.hp, color: Colors.transparent, child: child),
  //   );
  // }

  Widget buildMarquee() {
    List name = [];
    List price = [];
    String mergstring = '';
    String mergprice = '';
    // log(index);
    var json = jsonEncode(categoryController.getcategory[0].data!.materials!
        .map((e) => "${e.materialName} - ${e.materialPrice}")
        .toList());
    var jsoncode = jsonDecode(json);

// var list = ['one', 'two', 'three'];
//     var stringList = list.join("");
// var json = jsonEncode(opAttrList.map((e) => e.toJson()).toList());
    // categoryController.getcategory[0].data!.materials!.forEach((element) {
    //   name.add(element.materialName);
    //   price.add(element.materialPrice);
    //   mergprice = price.join(",");
    //   mergstring = name.join("- $mergprice ,");
    //   // mergprice = price.join(",");
    //   // log("runn->${categoryController.name}");
    // });
    return Marquee(
      text: "${jsoncode} ",
      style: GoogleFonts.jost(
          textStyle: TextStyle(
              fontSize: 10.0.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600)),
      pauseAfterRound: const Duration(seconds: 1),
      showFadingOnlyWhenScrolling: true,
      // fadingEdgeEndFraction: 1,
      numberOfRounds: 120,
      startPadding: 1.0,
      accelerationCurve: Curves.linear,
      decelerationDuration: Duration(milliseconds: 500),
      velocity: 45.0,
    );
  }
}
