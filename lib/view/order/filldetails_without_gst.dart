// import 'package:zero_scarp/allpackages.dart';

// class FillDetailsWithoutGst extends StatefulWidget {
//   const FillDetailsWithoutGst({Key? key}) : super(key: key);

//   @override
//   State<FillDetailsWithoutGst> createState() => _FillDetailsWithoutGstState();
// }

// class _FillDetailsWithoutGstState extends State<FillDetailsWithoutGst> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           color: const Color(0xffD9D9D9).withOpacity(0.1),
//           height: 7.0.hp, width: 95.0.wp,
//           // padding: const EdgeInsets.only(
//           //   left: 20,
//           //   right: 20,
//           // ),
//           child: TextFormField(
//             style: GoogleFonts.jost(
//                 textStyle: TextStyle(
//                     fontSize: 10.0.sp,
//                     color: forminputcolor,
//                     fontWeight: FontWeight.w500)),
//             decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: const BorderSide(color: appcolor, width: 1),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                       color: const Color(0xffC6C6C6).withOpacity(0.5),
//                       width: 1),
//                 ),
//                 fillColor: const Color(0xffC6C6C6),
//                 hintText: 'Full Name',
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 hintStyle: GoogleFonts.jost(
//                     textStyle: TextStyle(
//                         fontSize: 10.0.sp,
//                         color: formhintcolor,
//                         fontWeight: FontWeight.w500)),
//                 border: const OutlineInputBorder(
//                   gapPadding: 4,
//                 )),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Container(
//           color: const Color(0xffD9D9D9).withOpacity(0.1),
//           height: 7.0.hp, width: 95.0.wp,
//           // padding: const EdgeInsets.only(
//           //   left: 20,
//           //   right: 20,
//           // ),
//           child: TextFormField(
//             style: GoogleFonts.jost(
//                 textStyle: TextStyle(
//                     fontSize: 10.0.sp,
//                     color: forminputcolor,
//                     fontWeight: FontWeight.w500)),
//             decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: const BorderSide(color: appcolor, width: 1),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                       color: const Color(0xffC6C6C6).withOpacity(0.5),
//                       width: 1),
//                 ),
//                 fillColor: const Color(0xffC6C6C6),
//                 hintText: 'Company Name',
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 hintStyle: GoogleFonts.jost(
//                     textStyle: TextStyle(
//                         fontSize: 10.0.sp,
//                         color: formhintcolor,
//                         fontWeight: FontWeight.w500)),
//                 border: const OutlineInputBorder(
//                   gapPadding: 4,
//                 )),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Container(
//           color: const Color(0xffD9D9D9).withOpacity(0.1),
//           height: 7.0.hp, width: 95.0.wp,
//           // padding: const EdgeInsets.only(
//           //   left: 20,
//           //   right: 20,
//           // ),
//           child: TextFormField(
//             style: GoogleFonts.jost(
//                 textStyle: TextStyle(
//                     fontSize: 10.0.sp,
//                     color: forminputcolor,
//                     fontWeight: FontWeight.w500)),
//             decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: const BorderSide(color: appcolor, width: 1),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                       color: const Color(0xffC6C6C6).withOpacity(0.5),
//                       width: 1),
//                 ),
//                 fillColor: const Color(0xffC6C6C6),
//                 hintText: 'Email ID',
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 hintStyle: GoogleFonts.jost(
//                     textStyle: TextStyle(
//                         fontSize: 10.0.sp,
//                         color: formhintcolor,
//                         fontWeight: FontWeight.w500)),
//                 border: const OutlineInputBorder(
//                   gapPadding: 4,
//                 )),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Container(
//           color: const Color(0xffD9D9D9).withOpacity(0.1),
//           height: 9.0.hp, width: 95.0.wp,
//           // padding: const EdgeInsets.only(
//           //   left: 20,
//           //   right: 20,
//           // ),
//           child: TextFormField(
//             maxLength: 10,
//             keyboardType: TextInputType.number,
//             style: GoogleFonts.jost(
//                 textStyle: TextStyle(
//                     fontSize: 10.0.sp,
//                     color: forminputcolor,
//                     fontWeight: FontWeight.w500)),
//             decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: const BorderSide(color: appcolor, width: 1),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                       color: const Color(0xffC6C6C6).withOpacity(0.5),
//                       width: 1),
//                 ),
//                 fillColor: const Color(0xffC6C6C6),
//                 hintText: 'Mobile Number',
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 hintStyle: GoogleFonts.jost(
//                     textStyle: TextStyle(
//                         fontSize: 10.0.sp,
//                         color: formhintcolor,
//                         fontWeight: FontWeight.w500)),
//                 border: const OutlineInputBorder(
//                   gapPadding: 4,
//                 )),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Container(
//           color: const Color(0xffD9D9D9).withOpacity(0.1),
//           height: 7.0.hp, width: 95.0.wp,
//           // padding: const EdgeInsets.only(
//           //   left: 20,
//           //   right: 20,
//           // ),
//           child: TextFormField(
//             style: GoogleFonts.jost(
//                 textStyle: TextStyle(
//                     fontSize: 10.0.sp,
//                     color: forminputcolor,
//                     fontWeight: FontWeight.w500)),
//             decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: const BorderSide(color: appcolor, width: 1),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                       color: const Color(0xffC6C6C6).withOpacity(0.5),
//                       width: 1),
//                 ),
//                 fillColor: const Color(0xffC6C6C6),
//                 hintText: 'Address',
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 hintStyle: GoogleFonts.jost(
//                     textStyle: TextStyle(
//                         fontSize: 10.0.sp,
//                         color: formhintcolor,
//                         fontWeight: FontWeight.w500)),
//                 border: const OutlineInputBorder(
//                   gapPadding: 4,
//                 )),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Container(
//           color: const Color(0xffD9D9D9).withOpacity(0.1),
//           height: 7.0.hp, width: 95.0.wp,
//           // padding: const EdgeInsets.only(
//           //   left: 20,
//           //   right: 20,
//           // ),
//           child: TextFormField(
//             style: GoogleFonts.jost(
//                 textStyle: TextStyle(
//                     fontSize: 10.0.sp,
//                     color: forminputcolor,
//                     fontWeight: FontWeight.w500)),
//             decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: const BorderSide(color: appcolor, width: 1),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                       color: const Color(0xffC6C6C6).withOpacity(0.5),
//                       width: 1),
//                 ),
//                 fillColor: const Color(0xffC6C6C6),
//                 hintText: 'Street Name',
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 hintStyle: GoogleFonts.jost(
//                     textStyle: TextStyle(
//                         fontSize: 10.0.sp,
//                         color: formhintcolor,
//                         fontWeight: FontWeight.w500)),
//                 border: const OutlineInputBorder(
//                   gapPadding: 4,
//                 )),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Container(
//           color: const Color(0xffD9D9D9).withOpacity(0.1),
//           height: 7.0.hp, width: 95.00.wp,
//           // padding: const EdgeInsets.only(
//           //   left: 20,
//           //   right: 20,
//           // ),
//           child: TextFormField(
//             style: GoogleFonts.jost(
//                 textStyle: TextStyle(
//                     fontSize: 10.0.sp,
//                     color: forminputcolor,
//                     fontWeight: FontWeight.w500)),
//             decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: const BorderSide(color: appcolor, width: 1),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                       color: const Color(0xffC6C6C6).withOpacity(0.5),
//                       width: 1),
//                 ),
//                 fillColor: const Color(0xffC6C6C6),
//                 hintText: 'State',
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 hintStyle: GoogleFonts.jost(
//                     textStyle: TextStyle(
//                         fontSize: 10.0.sp,
//                         color: formhintcolor,
//                         fontWeight: FontWeight.w500)),
//                 border: const OutlineInputBorder(
//                   gapPadding: 4,
//                 )),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Container(
//           color: const Color(0xffD9D9D9).withOpacity(0.1),
//           height: 7.0.hp, width: 95.0.wp,
//           // padding: const EdgeInsets.only(
//           //   left: 20,
//           //   right: 20,
//           // ),
//           child: TextFormField(
//             style: GoogleFonts.jost(
//                 textStyle: TextStyle(
//                     fontSize: 10.0.sp,
//                     color: forminputcolor,
//                     fontWeight: FontWeight.w500)),
//             decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: const BorderSide(color: appcolor, width: 1),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                       color: const Color(0xffC6C6C6).withOpacity(0.5),
//                       width: 1),
//                 ),
//                 fillColor: const Color(0xffC6C6C6),
//                 hintText: 'City',
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 hintStyle: GoogleFonts.jost(
//                     textStyle: TextStyle(
//                         fontSize: 10.0.sp,
//                         color: formhintcolor,
//                         fontWeight: FontWeight.w500)),
//                 border: const OutlineInputBorder(
//                   gapPadding: 4,
//                 )),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Container(
//           color: const Color(0xffD9D9D9).withOpacity(0.1),
//           height: 7.0.hp, width: 95.0.wp,
//           // padding: const EdgeInsets.only(
//           //   left: 20,
//           //   right: 20,
//           // ),
//           child: TextFormField(
//             keyboardType: TextInputType.number,
//             style: GoogleFonts.jost(
//                 textStyle: TextStyle(
//                     fontSize: 10.0.sp,
//                     color: forminputcolor,
//                     fontWeight: FontWeight.w500)),
//             decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: const BorderSide(color: appcolor, width: 1),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                       color: const Color(0xffC6C6C6).withOpacity(0.5),
//                       width: 1),
//                 ),
//                 fillColor: const Color(0xffC6C6C6),
//                 hintText: 'Pincode',
//                 contentPadding: const EdgeInsets.only(left: 10),
//                 hintStyle: GoogleFonts.jost(
//                     textStyle: TextStyle(
//                         fontSize: 10.0.sp,
//                         color: formhintcolor,
//                         fontWeight: FontWeight.w500)),
//                 border: const OutlineInputBorder(
//                   gapPadding: 4,
//                 )),
//           ),
//         ),
//       ],
//     );
//   }
// }
