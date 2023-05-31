import 'package:zero_scarp/allpackages.dart';
import 'package:zero_scarp/view/order/withgstconfirmdetail.dart';

class YourDetailSection extends StatefulWidget {
  var selectedgst;
  YourDetailSection({Key? key, this.selectedgst}) : super(key: key);

  @override
  State<YourDetailSection> createState() => _YourDetailSectionState();
}

class _YourDetailSectionState extends State<YourDetailSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 95.00.wp,
          decoration: BoxDecoration(
              color: const Color(0xffC6C6C6).withOpacity(0.2),
              borderRadius: BorderRadius.circular(3),
              border:
                  Border.all(color: const Color(0xffC6C6C6).withOpacity(0.4))),
          child: Column(
            children: [
              // ListView.builder(
              //     itemCount: detailsnames.length,
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return
              GstConfirmDetail(selectedgst: widget.selectedgst),
              // }),
              SizedBox(
                height: 4.00.hp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
