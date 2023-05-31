import 'package:zero_scarp/allpackages.dart';

// import '../../controller/category_controller.dart';
import '../../controller/homescreen_controller.dart';

class ApartmentList extends StatefulWidget {
  var fetchindex;
  ApartmentList({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<ApartmentList> createState() => _ApartmentListState();
}

class _ApartmentListState extends State<ApartmentList> {
  HomeScreen_separate_Controller homeScreen_separate_Controller =
      Get.put(HomeScreen_separate_Controller());

  @override
  Widget build(BuildContext context) {
    return
        // ListView.builder(
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   itemCount: homeScreen_separate_Controller
        //       .gethome[0].data![0].subcategory!.length,
        //   // subCategoryController.getsubcategory[0].data!.subcategory!.length,
        //   //  padding: EdgeInsets.only(top: 30),
        //   itemBuilder: (context, index) {
        //     // var data =
        //     //     subCategoryController.getsubcategory[0].data!.subcategory![index];
        //     return
        Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.11,
              child: Image.network(homeScreen_separate_Controller
                  .gethome[0].data![0].subcategory![0].subcategoryImage!
                  .toString()),
              // CircleAvatar(
              //   radius: 30.0,
              //   backgroundImage: NetworkImage(),
              // ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.26,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                        homeScreen_separate_Controller.gethome[0].data![0]
                            .subcategory![0].subcategoryName!
                            .toString(),
                        style: socialbutton),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text("210/kg", style: socialbutton),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.0.hp,
        ),
        const Divider(
          height: 2,
          thickness: 1,
          indent: 12,
          endIndent: 12,
          color: Color.fromARGB(255, 227, 224, 224),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.11,
              child: Image.network(homeScreen_separate_Controller
                  .gethome[0].data![0].subcategory![1].subcategoryImage!
                  .toString()),

              // CircleAvatar(
              //   radius: 30.0,
              //   backgroundImage: NetworkImage(),
              // ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.26,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                        homeScreen_separate_Controller.gethome[0].data![0]
                            .subcategory![1].subcategoryName!
                            .toString(),
                        style: socialbutton),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text("210/kg", style: socialbutton),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.0.hp,
        ),
      ],
    );
    //   },
    // );
  }
}
