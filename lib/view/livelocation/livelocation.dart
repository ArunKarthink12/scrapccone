import 'dart:math';

// import 'package:advanced_search/advanced_search.dart';
import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/view/livelocation/book_data.dart';
import 'package:zero_scarp/view/livelocation/searchitems.dart';

import '../../controller/arealocationservice.dart';
// import '../../model/arealocationmodel.dart';
import 'area.dart';
import 'book.dart';
// import 'book.dart';

class AreasScreen extends StatefulWidget {
  var city;
  AreasScreen({super.key, this.city});

  @override
  State<AreasScreen> createState() => _AreasScreenState();
}

class _AreasScreenState extends State<AreasScreen> {
  // late List<Book> books;
  AssetImage? images;
  Arealocation_Controller arealocation_controller =
      Get.put(Arealocation_Controller());
  void initState() {
    arealocation_controller.cityclocationController(city: widget.city);

    super.initState();
    images = const AssetImage(
      "assets/images/Directions.gif",
    );
    setState(() {});
    // books = allBooks;
  }

  @override
  void dispose() {
    //  print('${widget.asset} dispose');
    images!.evict();
    super.dispose();
  }

  double get randHeight => Random().nextInt(100).toDouble();
  final RxList<Widget> _randomChildren = <Widget>[].obs;
  RxList<Widget> _randomHeightWidgets(BuildContext context) {
    _randomChildren.value = List.generate(1, (index) {
      final height = randHeight.clamp(
        50.0,
        MediaQuery.of(context)
            .size
            .width, // simply using MediaQuery to demonstrate usage of context
      );
      return Column(
        children: [
          SizedBox(height: 4.0.hp),
          Container(
            height: 40.0.hp,
            width: 80.0.wp,
            decoration: BoxDecoration(image: DecorationImage(image: images!)),
          ),
          SizedBox(
            child: Text(
              'Choose your Area',
              style: toptitleStyle,
            ),
          ),
          SizedBox(
            height: .5.hp,
          ),
          SizedBox(
            child: Text(
              textAlign: TextAlign.center,
              'Our services are available only to the listed area’s\ninside Coimbatore',
              style: subtitleStyle,
            ),
          ),
          SizedBox(
            height: 1.7.hp,
          ),
        ],
      );
    });

    return _randomChildren;
  }

  back() {
    Navigator.pop(context);
    // return Get.to(CityScreen());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: appcolor,
          body: SafeArea(
            child: SizedBox(
              child: Stack(
                children: [
                  DraggableScrollableSheet(
                    builder: (BuildContext buildContext,
                        ScrollController scrollController) {
                      return Material(
                          elevation: 5,
                          shadowColor: Colors.black,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0),
                                ),
                                color: Colors.white),
                            child: DefaultTabController(
                              length: 2,
                              child: NestedScrollView(
                                headerSliverBuilder: (context, _) {
                                  return [
                                    SliverList(
                                      delegate: SliverChildListDelegate(
                                        _randomHeightWidgets(context),
                                      ),
                                    ),
                                  ];
                                },
                                body: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Obx(() {
                                      if (arealocation_controller
                                          .areaload.value) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (arealocation_controller
                                          .arealist.isEmpty) {
                                        return const Center(
                                          child: Text("No area in this limit"),
                                        );
                                      } else {
                                        arealocation_controller.allBooks.value =
                                            arealocation_controller
                                                .arealist[0].area;
                                        return ExampleApp(
                                            city: widget.city,
                                            books:
                                                // arealocation_controller.allBooks
                                                arealocation_controller
                                                    .arealist[0].area);
                                      }
                                    })),
                              ),
                            ),
                          ));
                    },
                    initialChildSize: .9,
                    minChildSize: .85,
                    maxChildSize: 0.95,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
