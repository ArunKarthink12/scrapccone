import 'package:zero_scarp/allpackages.dart';

class ImageSliderHome extends StatefulWidget {
  const ImageSliderHome({Key? key}) : super(key: key);

  @override
  State<ImageSliderHome> createState() => _ImageSliderHomeState();
}

class _ImageSliderHomeState extends State<ImageSliderHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.27,
        // height: 185,
        color: Colors.white,
        child: SlidingBannerAuto());
  }
}
