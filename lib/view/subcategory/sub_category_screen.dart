import 'dart:developer';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:gif_view/gif_view.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/subcategory_controller.dart';

import '../../controller/category_controller.dart';
// import '../../controller/homescreen_controller.dart';

class SubCategoryScreen extends StatefulWidget {
  var id;
  var name;
  // var fetchindex;
  SubCategoryScreen({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen>
    with SingleTickerProviderStateMixin {
  SubCategoryController subCategoryController =
      Get.put(SubCategoryController());
  CategoryController categoryController = Get.put(CategoryController());
  // HomeScreen_separate_Controller homeScreen_separate_Controller =
  //     Get.put(HomeScreen_separate_Controller());
  late AnimationController expandController;
  late Animation<double> animation;
  GifController controller = GifController();
  @override
  void initState() {
    fetcData();
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    expandController.addListener(() {
      setState(() {});
    });
    expandController.forward();
    location();
    super.initState();
  }

  fetcData() {
    Future.delayed(Duration.zero, () async {
      await subCategoryController
          .subCategoryController(categoryId: widget.id.toString())
          .then((value) => loopfetcData());
    });
  }

  loopfetcData() {
    Future.delayed(const Duration(seconds: 1), () async {
      controller.pause();
    });
  }

  location() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // runeToLowerCase();
    subCategoryController.area =
        sharedPreferences.getString(Constants.area)!.toLowerCase();
    // subCategoryController.area.toLowerCase();
    log(subCategoryController.area);
  }

  @override
  void dispose() {
    Get.delete<SubCategoryController>();
    expandController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  back() {
    Navigator.of(context).pop();
    // Get.offAll(const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (subCategoryController.subcategoryLoad.isTrue) {
        return WillPopScope(
          onWillPop: () {
            // log('onwilll-----------');
            return back();
            // Get.offAll(const HomePage());
            // return true;
          },
          child: const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else if (subCategoryController.getsubcategory.isEmpty) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Subcategory not found',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        );
      } else {
        return Scaffold(
            backgroundColor: const Color(0xffF5F5F5),
            appBar: AppBar(
                elevation: 10,
                backgroundColor: const Color(0xff283736),
                centerTitle: true,
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Get.offAll(const HomePage());
                    },
                    child: Image.asset(
                      'assets/images/back.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: Text(
                  widget.name.toString(),
                  style: apptitle,
                )),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  /* CarouselSlider.builder(
                    itemCount: subCategoryController
                        .getsubcategory[0].data!.subcategory!.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: MediaQuery.of(context).size.width * 1,
                        // height: 185,
                        color: appcolor,
                        child: AnimatedBuilder(
                            animation: expandController,
                            builder: (BuildContext context, child) {
                              return CachedNetworkImage(
                                imageUrl: (subCategoryController
                                    .getsubcategory[0]
                                    .data!
                                    .subcategory![index]
                                    .bannerimageUrl
                                    .toString()),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              );
                            }),
                        // CachedNetworkImage(
                        //   imageUrl: (subCategoryController.getsubcategory[0]
                        //       .data!.subcategory![index].bannerimageUrl
                        //       .toString()),
                        // ),
                      );
                    },
                    options: CarouselOptions(autoPlay: false),
                  ),
                  */
                  Container(
                      height: MediaQuery.of(context).size.height * 0.28,
                      width: MediaQuery.of(context).size.width * 1,
                      // height: 185,
                      color: appcolor,
                      child:
                          // GifView.asset('assets/images/apartment.png')

                          // AnimatedBuilder(
                          //     // 8. pass the AnimationController as an input
                          //     animation: expandController,
                          //     builder: (BuildContext context, Widget? child) {
                          //       return
                          GifView.network(
                              controller: controller,
                              subCategoryController.getsubcategory[0].data!
                                  .subcategory!.first.bannerimageUrl
                                  .toString())
                      // }),
                      // CachedNetworkImage(
                      //   imageUrl: (subCategoryController.getsubcategory[0].data!
                      //       .subcategory!.first.bannerimageUrl
                      //       .toString()),
                      //   placeholder: (context, url) =>
                      //       CircularProgressIndicator(),
                      //   errorWidget: (context, url, error) => Icon(Icons.error),
                      // ),
                      // CachedNetworkImage(
                      //   imageUrl: (subCategoryController.getsubcategory[0]
                      //       .data!.subcategory![index].bannerimageUrl
                      //       .toString()),
                      // ),
                      ),
                  Container(
                    height: 10.0.hp,
                    width: 100.0.wp,
                    decoration: const BoxDecoration(
                        color: Color(0xff1E425E),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SUB - CATEGORY',
                              style: apptitle,
                            ),
                            // Container(
                            //     height: 3.0.hp,
                            //     width: 15.0.wp,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(4),
                            //       border:
                            //           Border.all(color: Colors.white, width: 1),
                            //       color: const Color(0xff263238),
                            //     ),
                            //     child: Center(
                            //         child: Text(
                            //       'All',
                            //       style: GoogleFonts.jost(
                            //           textStyle: TextStyle(
                            //               fontSize: 10.0.sp,
                            //               color: screenbackground,
                            //               fontWeight: FontWeight.w500)),
                            //     )))
                          ]),
                    ),
                  ),
                  const SubCategoryList(),
                  SizedBox(
                    height: 4.0.hp,
                  ),
                ],
              ),
            )));
      }
    });
  }
}
