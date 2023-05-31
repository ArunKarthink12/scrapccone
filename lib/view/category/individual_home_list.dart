import 'package:zero_scarp/allpackages.dart';

import '../../controller/homescreen_controller.dart';

class IndividualHomeList extends StatefulWidget {
  const IndividualHomeList({Key? key}) : super(key: key);

  @override
  State<IndividualHomeList> createState() => _IndividualHomeListState();
}

class _IndividualHomeListState extends State<IndividualHomeList> {
  HomeScreen_separate_Controller homeScreen_separate_Controller =
      Get.put(HomeScreen_separate_Controller());

  @override
  Widget build(BuildContext context) {
    return
        // ListView.builder(
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   itemCount: homeScreen_separate_Controller
        //       .gethome[0].data![1].subcategory!.length,
        //   //  padding: EdgeInsets.only(top: 30),
        //   itemBuilder: (context, index) {
        //     return
        Column(children: [
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
                  .gethome[0].data![1].subcategory![0].subcategoryImage!
                  .toString())
              //  CircleAvatar(
              //   radius: 30.0,
              //   backgroundImage:
              // NetworkImage(homeScreen_separate_Controller
              //     .gethome[0].data![1].subcategory![0].subcategoryImage!
              //     .toString()),
              // ),
              ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                      homeScreen_separate_Controller
                          .gethome[0].data![1].subcategory![0].subcategoryName!
                          .toString(),
                      style: socialbutton),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text('210/kg', style: socialbutton),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 1.0.hp,
      )
    ]);
    //   },
    // );
  }
}
