// import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/controller/category_controller.dart';

import '../../controller/homescreen_controller.dart';
import '../../controller/subcategory_controller.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  CategoryController categoryController = Get.put(CategoryController());
  SubCategoryController subCategoryController =
      Get.put(SubCategoryController());
  HomeScreen_separate_Controller homeScreen_separate_Controller =
      Get.put(HomeScreen_separate_Controller());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GridView.builder(
                  itemCount:
                      categoryController.getcategory[0].data!.category!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = categoryController
                        .getcategory[0].data!.category![index];
                    return InkWell(
                      onTap: () {
                        // categoryController.id = data.categoryId.toString();

                        // categoryController.catname = data.categoryName;
                        var id = data.categoryId.toString();
                        subCategoryController.id = data.categoryId;
                        subCategoryController.name = data.categoryName;
                        Get.to(SubCategoryScreen(
                          name: data.categoryName!,
                          id: id,
                        ));
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 0.5,
                                color: Colors.grey.shade600,
                                spreadRadius: 0.5)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.0.hp,
                            ),
                            SizedBox(
                              height: 5.3.hp,
                              child: Image.network(
                                data.categoryImage ?? "",
                              ),
                            ),
                            SizedBox(
                              height: 1.0.hp,
                            ),
                            SizedBox(
                              child: Text(
                                maxLines: 2,
                                data.categoryName!,
                                textAlign: TextAlign.center,
                                style: socialbutton,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    crossAxisCount: 3,
                  )),
            ),
            ///////////////////////
            ///use this if needed//
            ///////////////////////
            // SizedBox(
            //   height: 3.0.hp,
            // ),
            // Obx(() {
            //   if (homeScreen_separate_Controller.homeLoad == true) {
            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   } else if (homeScreen_separate_Controller.gethome.isEmpty) {
            //     return Center(
            //       child: Text("No Data"),
            //     );
            //   } else {
            //     return Column(
            //       children: [
            //         Apartments(),
            //         SizedBox(
            //           height: 3.0.hp,
            //         ),
            //         IndividualHome()
            //       ],
            //     );
            //   }
            // })
          ])),
    );
  }
}
