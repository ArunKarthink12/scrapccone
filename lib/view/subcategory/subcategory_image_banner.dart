import 'package:zero_scarp/allpackages.dart';

// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];

var imgListsubcategory = [
  'assets/images/category.png',
  'assets/images/pic1.png',
  'assets/images/pic2.png',
  'assets/images/pic3.png',
];

class SlidingBannerSubCategory extends StatefulWidget {
  const SlidingBannerSubCategory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SlidingBannerSubCategoryState();
  }
}

class _SlidingBannerSubCategoryState extends State<SlidingBannerSubCategory> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgListsubcategory
        .map((item) => Image.asset(
              item,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.42,
            ))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.42,
          width: MediaQuery.of(context).size.width * 1,
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.36,
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: imgListsubcategory.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.02,
                        height: MediaQuery.of(context).size.height * 0.02,
                        margin: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: appcolor.withOpacity(
                                    _current == entry.key ? 0.5 : 0.4)),
                            shape: BoxShape.circle,
                            color: (_current == entry.key
                                ? appcolor
                                : Colors.white)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
