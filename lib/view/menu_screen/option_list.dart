import 'dart:developer';

import 'package:zero_scarp/allpackages.dart';

import 'readprofile.dart';

class OptionList extends StatefulWidget {
  const OptionList({Key? key}) : super(key: key);

  @override
  State<OptionList> createState() => _OptionListState();
}

class _OptionListState extends State<OptionList> {
  var menuoptions = [
    'HOME',
    'NOTIFICATIONS',
    'YOUR ORDER',
    'ORDER HISTORY',
    'PROFILE',
    'CHANGE PASSWORD'
  ];
  var menuscreens = [
    const HomePage(),
    const NotificationScreen(),
    const YourOrderScreen(),
    const HistoryScreen(),
    const ReadProfileScreen(),
    // const EditProfileScreen(),
    const ChangePasswordScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menuoptions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  log("index$index");
                  if (index == 0) {
                    Get.offAll(menuscreens[index]);
                  } else {
                    Get.to(menuscreens[index]);
                  }
                },
                child: Container(
                  width: 95.00.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(width: 2, color: const Color(0xffF5F5F5))),
                  padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                  child: Row(
                    children: [
                      Text(
                        menuoptions[index],
                        style: menuprofiloption,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        });
  }
}
