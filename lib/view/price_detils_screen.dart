import 'package:zero_scarp/allpackages.dart';

class PriceDetailsScreen extends StatefulWidget {
  const PriceDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PriceDetailsScreen> createState() => _PriceDetailsScreenState();
}

class _PriceDetailsScreenState extends State<PriceDetailsScreen> {
  var names = [
    'Paper Waste',
    'Plastic Waste',
    'Ferrous  Metal',
    'Non - Ferrous  Metal',
    'E - Waste'
  ];
  var selectedindex = 0;
  var type = ['News paper', 'Magazine', 'Note Book'];
  var price = ['Rs. 650', 'Rs. 720', 'Rs. 800'];
  var quantity = ['10', '12', '14'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 10,
          backgroundColor: const Color(0xff283736),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                'assets/images/back.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
          title: Text(
            'PRICE DETAILS',
            style: apptitle,
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 4.0.hp,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                          });
                        },
                        child: Container(
                          height: 5.0.hp,
                          width: 95.0.wp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: selectedindex == index
                                  ? const Color(0xff455A64)
                                  : const Color(0xffC6C6C6).withOpacity(0.2),
                              border: Border.all(
                                  color: selectedindex == index
                                      ? const Color(0xff455A64)
                                      : const Color(0xffC6C6C6)
                                          .withOpacity(0.2),
                                  width: 1)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 50.0.wp,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(children: [
                                      Flexible(
                                          child: Text(
                                        names[index],
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontSize: 10.0.sp,
                                                color: selectedindex == index
                                                    ? Colors.white
                                                    : const Color(0xff969696),
                                                fontWeight: FontWeight.w500)),
                                      ))
                                    ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 30.0.wp,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                  child: Text(
                                                names[index],
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        fontSize: 9.0.sp,
                                                        color: selectedindex ==
                                                                index
                                                            ? Colors.white
                                                            : const Color(
                                                                0xff969696),
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ))
                                            ]),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Image.asset(
                                        selectedindex == index
                                            ? 'assets/images/up.png'
                                            : 'assets/images/down.png',
                                        height: 11,
                                        width: 11,
                                        color: selectedindex == index
                                            ? Colors.white
                                            : const Color(0xff969696),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      selectedindex == index
                          ? Container(
                              width: 95.0.wp,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.4))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 2.0.hp,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    color: const Color(0xff5EBDB7),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 1.0.hp,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 30.0.wp,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        'Type',
                                                        style: GoogleFonts.jost(
                                                            textStyle: TextStyle(
                                                                fontSize:
                                                                    11.0.sp,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30.0.wp,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        'KG',
                                                        style: GoogleFonts.jost(
                                                            textStyle: TextStyle(
                                                                fontSize:
                                                                    11.0.sp,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30.0.wp,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        'Price',
                                                        style: GoogleFonts.jost(
                                                            textStyle: TextStyle(
                                                                fontSize:
                                                                    11.0.sp,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.0.hp,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        ListView.builder(
                                            itemCount: type.length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 30.0.wp,
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    type[index],
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: GoogleFonts.jost(
                                                                        textStyle: TextStyle(
                                                                            fontSize:
                                                                                11.0.sp,
                                                                            color: const Color(0xff6F6969),
                                                                            fontWeight: FontWeight.w500)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 30.0.wp,
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    quantity[
                                                                        index],
                                                                    style: GoogleFonts.jost(
                                                                        textStyle: TextStyle(
                                                                            fontSize:
                                                                                11.0.sp,
                                                                            color: const Color(0xff6F6969),
                                                                            fontWeight: FontWeight.w500)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 30.0.wp,
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    price[
                                                                        index],
                                                                    style: GoogleFonts.jost(
                                                                        textStyle: TextStyle(
                                                                            fontSize:
                                                                                11.0.sp,
                                                                            color: const Color(0xff6F6969),
                                                                            fontWeight: FontWeight.w500)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 85.0.wp,
                                                    color: Colors.grey[300],
                                                    height: 0.5,
                                                  ),
                                                ],
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.0.hp,
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                }),
          ],
        ),
      )),
    );
  }
}
