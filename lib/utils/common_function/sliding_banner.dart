import 'dart:developer';

import 'package:shimmer/shimmer.dart';
import 'package:zero_scarp/allpackages.dart';

import '../../controller/category_controller.dart';

class SlidingBannerAuto extends StatefulWidget {
  const SlidingBannerAuto({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SlidingBannerAutoState();
  }
}

class _SlidingBannerAutoState extends State<SlidingBannerAuto> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  CategoryController categoryController = Get.put(CategoryController());

  // var imgList = [
  //   'assets/images/category.png',
  //   'assets/images/pic1.png',
  //   'assets/images/pic2.png',
  //   'assets/images/pic3.png',
  // ];

  @override
  Widget build(BuildContext context) {
    // var imgList = categoryController.getcategory[0].data!.bannerImage![0].bannerUrl;

    final List<Widget> imageSliders = categoryController
        .getcategory[0].data!.bannerImage!
        .map((item) => Image.network(item.bannerUrl,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 202
            // /MediaQuery.of(context).size.height * 0.42,
            ))
        .toList();
    return Container(
      height: 202,
      // MediaQuery.of(context).size.height * 0.44,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Stack(children: [
        Positioned(
          bottom: 14,
          child: Container(
            color: Colors.white,
            height: 202,
            // MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            width: MediaQuery.of(context).size.width * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            color: const Color(0xff5EBDB7),
                            border: Border.all(
                              color: const Color(0xff5EBDB7),
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                _controller.previousPage(
                                    duration: Duration(milliseconds: 1),
                                    curve: Curves.linear);
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              color: Color(0xFFF6F4F4),
                            ),
                            InkWell(
                              onTap: () {
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 1),
                                    curve: Curves.linear);
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 12,
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
