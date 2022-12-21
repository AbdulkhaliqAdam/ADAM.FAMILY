// import 'package:adam_family/constants.dart';
// import 'package:flutter/material.dart';

// class Dashboard extends StatelessWidget {
//   const Dashboard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final txtTheme = Theme.of(context).textTheme;

//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//           leading: Icon(
//             Icons.menu,
//             //For Dark Color
//             // color: isDark ? tWhiteColor : tDarkColor,
//             color: tDarkColor,
//           ),
//           title: Text('tAppName', style: Theme.of(context).textTheme.headline4),
//           actions: [
//             Container(
//               margin: const EdgeInsets.only(right: 20, top: 7),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 //For Dark Color
//                 // color: isDark ? tSecondaryColor : tCardBgColor,
//                 color: tCardBgColor,
//               ),
//               child: IconButton(
//                   onPressed: () {},
//                   icon: const Image(image: AssetImage('tUserProfileImage'))),
//             )
//           ],
//         ),
//         body: SingleChildScrollView(
//             child: Container(
//           padding: const EdgeInsets.all(tDashboardCardPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 tDashboardTitle,
//                 style: txtTheme.bodyText2,
//               ),
//               Text(tDashboardHeading, style: txtTheme.headline2),
//               const SizedBox(
//                 height: tDashboardCardPadding,
//               ),

//               Container(
//                 decoration: const BoxDecoration(
//                     border: Border(left: BorderSide(width: 4))),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(tDashboardSearch,
//                         style: txtTheme.headline2
//                             ?.apply(color: Colors.grey.withOpacity(0.5))),
//                     const Icon(Icons.mic, size: 25),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: tDashboardCardPadding,
//               ),

//               SizedBox(
//                 height: 45,
//                 child: ListView.builder(
//                   // itemCount: list.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) => GestureDetector(
//                     // onTap: list[index].onPress,
//                     child: SizedBox(
//                       width: 170,
//                       height: 45,
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 45,
//                             height: 45,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: tDarkColor),
//                             child: Center(
//                               child: Text('list[index].title,',
//                                   style: txtTheme.headline6
//                                       ?.apply(color: Colors.white)),
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           Flexible(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text('list[index].heading',
//                                     style: txtTheme.headline6,
//                                     overflow: TextOverflow.ellipsis),
//                                 Text('list[index].subHeading',
//                                     style: txtTheme.bodyText2,
//                                     overflow: TextOverflow.ellipsis)
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: tDashboardCardPadding,
//               ),

//               // banners
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   //1st banner
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         //For Dark Color
//                         // color: isDark ? tSecondaryColor : tCardBgColor,
//                         color: tCardBgColor,
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               Flexible(
//                                   child: Image(
//                                       image: AssetImage('tBookmarkIcon'))),
//                               Flexible(
//                                   child: Image(
//                                       image: AssetImage('tBannerImage1'))),
//                             ],
//                           ),
//                           const SizedBox(height: 25),
//                           Text(tDashboardBannerTitle1,
//                               style: txtTheme.headline4,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis),
//                           Text(tDashboardBannerSubTitle,
//                               style: txtTheme.bodyText2,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: tDashboardCardPadding),
//                   //2nd Banner
//                   Expanded(
//                     child: Column(
//                       children: [
//                         //Card
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             //For Dark Color
//                             // color: isDark ? tSecondaryColor : tCardBgColor,
//                             color: tCardBgColor,
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 20),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   Flexible(
//                                       child: Image(
//                                           image: AssetImage('tBookmarkIcon'))),
//                                   Flexible(
//                                       child: Image(
//                                           image: AssetImage('tBannerImage2'))),
//                                 ],
//                               ),
//                               Text(tDashboardBannerTitle2,
//                                   style: txtTheme.headline4,
//                                   overflow: TextOverflow.ellipsis),
//                               Text(tDashboardBannerSubTitle,
//                                   style: txtTheme.bodyText2,
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         SizedBox(
//                           width: double.infinity,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: OutlinedButton(
//                                 onPressed: () {},
//                                 child: const Text(tDashboardButton)),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               Text(
//                 tDashboardTopCourses,
//                 style: txtTheme.headline4?.apply(fontSizeFactor: 1.2),
//               ),
//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   // itemCount: list.length,
//                   itemBuilder: (context, index) => GestureDetector(
//                     // onTap: list[index].onPress,
//                     child: SizedBox(
//                       width: 320,
//                       height: 200,
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 10, top: 5),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             //For Dark Color
//                             // color: isDark ? tSecondaryColor : tCardBgColor,
//                             color: tCardBgColor,
//                           ),
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Flexible(
//                                     child: Text(
//                                       'list[index].title',
//                                       style: txtTheme.headline4,
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                   Flexible(
//                                       child: Image(
//                                           image: AssetImage('list[index]'),
//                                           height: 110)),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                         shape: const CircleBorder()),
//                                     onPressed: () {},
//                                     child: const Icon(Icons.play_arrow),
//                                   ),
//                                   const SizedBox(width: tDashboardCardPadding),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         '3 Section',
//                                         style: txtTheme.headline4,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       Text(
//                                         'Programing Languages',
//                                         style: txtTheme.bodyText2,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )));
//   }
// }
