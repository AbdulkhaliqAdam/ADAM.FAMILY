// import 'package:adam_family/constants.dart';
// import 'package:adam_family/helper/theme_helper.dart';
// import 'package:adam_family/screens/login/lognin.dart';
// import 'package:adam_family/widgets/header_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'forgot_password_verification_page.dart';

// class ForgotPasswordPage extends StatefulWidget {
//   const ForgotPasswordPage({Key? key}) : super(key: key);

//   static String routeName = "/forgot_password_page";

//   @override
//   _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
// }

// String _countryCode = "+20";

// late String name;
// late String email;

// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   final _formKey = GlobalKey<FormState>();

//   TextEditingController countryController = TextEditingController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     countryController.text = "+91";
//     super.initState();
//   }

//   List<String> itemsList = ['Phone', 'Mail'];
//   String? selectedItem = 'Phone';

//   @override
//   Widget build(BuildContext context) {
//     double _headerHeight = 300;
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             height: _headerHeight,
//             child: HeaderWidget(_headerHeight, true, Icons.password_rounded),
//           ),
//           SafeArea(
//             child: Container(
//               margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
//               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//               child: Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.topLeft,
//                     margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'نسيت كلمة المرور؟',
//                           style: TextStyle(
//                             fontSize: 35,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           // textAlign: TextAlign.center,
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           '.أدخل بريدك الألكترونى المرتبط بحسابك',
//                           style: TextStyle(
//                             // fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           // textAlign: TextAlign.center,
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           'We will email you a verification code to check your authenticity.',
//                           style: TextStyle(
//                               // fontSize: 20,
//                               ),
//                           // textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 40.0),
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           child: TextFormField(
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: null,
//                               hintText: " أدخل البريد الألكترونى",
//                               labelText: "البريد الألكترونى ",
//                               contentPadding: EdgeInsets.symmetric(
//                                 vertical: 10,
//                                 horizontal: 20,
//                               ),
//                               border: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(20))),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Colors.red,
//                                   width: 1,
//                                 ),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.blue, width: 2),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(20))),
//                               floatingLabelBehavior: FloatingLabelBehavior.auto,
//                               prefixIcon: Padding(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Icon(Icons.email_rounded),
//                               ),
//                             ),
//                             validator: (val) {
//                               if (val!.isEmpty) {
//                                 return "لا يمكن ترك الحقل فارغ";
//                               } else if (!RegExp(
//                                       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
//                                   .hasMatch(val)) {
//                                 return "أدحل بريد ألكترونى صالح";
//                               }
//                               return null;
//                             },
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),

//                         //
//                         //

//                         SizedBox(
//                           height: 20,
//                         ),

//                         Container(
//                           height: 55,
//                           decoration: BoxDecoration(
//                               border: Border.all(width: 1, color: Colors.red),
//                               borderRadius: BorderRadius.circular(30)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 width: 120,
//                                 child: DropdownButtonFormField<String>(
//                                     decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide.none,
//                                         borderRadius: BorderRadius.all(
//                                           Radius.circular(20),
//                                         ),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               color: Colors.blue, width: 2),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(20))),
//                                       floatingLabelBehavior:
//                                           FloatingLabelBehavior.auto,
//                                     ),
//                                     value: selectedItem,
//                                     items: itemsList
//                                         .map((item) => DropdownMenuItem(
//                                               value: item,
//                                               child: Text(item),
//                                             ))
//                                         .toList(),
//                                     onChanged: (item) =>
//                                         setState(() => selectedItem = item)),
//                               ),
//                               Text(
//                                 "|",
//                                 style:
//                                     TextStyle(fontSize: 33, color: Colors.grey),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Expanded(
//                                   child: TextFormField(
//                                 keyboardType: TextInputType.phone,
//                                 textInputAction: TextInputAction.next,
//                                 cursorColor: kPrimaryColor,
//                                 onSaved: (newValue) => email = newValue!,
//                                 onChanged: (value) {
//                                   email = value;
//                                 },
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: "Phone",
//                                 ),
//                               ))
//                             ],
//                           ),
//                         ),

//                         SizedBox(
//                           height: 20,
//                         ),

//                         SizedBox(
//                           width: 500,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: 2,
//                                 child: SizedBox(
//                                   width: 200,
//                                   child: DropdownButtonFormField<String>(
//                                       decoration: InputDecoration(
//                                         filled: true,
//                                         fillColor: null,
//                                         contentPadding: EdgeInsets.symmetric(
//                                           vertical: 10,
//                                           horizontal: 20,
//                                         ),
//                                         border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(20))),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.red,
//                                             width: 1,
//                                           ),
//                                           borderRadius: BorderRadius.all(
//                                             Radius.circular(20),
//                                           ),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.blue, width: 2),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(20))),
//                                         floatingLabelBehavior:
//                                             FloatingLabelBehavior.auto,
//                                       ),
//                                       value: selectedItem,
//                                       items: itemsList
//                                           .map((item) => DropdownMenuItem(
//                                                 value: item,
//                                                 child: Text(item),
//                                               ))
//                                           .toList(),
//                                       onChanged: (item) =>
//                                           setState(() => selectedItem = item)),
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 6,
//                                 child: TextFormField(
//                                   keyboardType: TextInputType.emailAddress,
//                                   textInputAction: TextInputAction.next,
//                                   cursorColor: kPrimaryColor,
//                                   onSaved: (newValue) => email = newValue!,
//                                   onChanged: (value) {
//                                     email = value;
//                                   },
//                                   decoration: InputDecoration(
//                                     filled: true,
//                                     fillColor: null,
//                                     // labelText: "رقم الهاتف",
//                                     contentPadding: EdgeInsets.symmetric(
//                                       vertical: 10,
//                                       horizontal: 20,
//                                     ),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(20))),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Colors.red,
//                                         width: 1,
//                                       ),
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(20),
//                                       ),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Colors.blue, width: 2),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(20))),
//                                     floatingLabelBehavior:
//                                         FloatingLabelBehavior.auto,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         // Row(
//                         //   children: [
//                         //     Expanded(
//                         //       flex: 2,
//                         //       child: DropdownButtonFormField<String>(
//                         //           decoration: InputDecoration(
//                         //             prefixIcon: Padding(
//                         //               padding: EdgeInsets.all(8),
//                         //               child: Icon(
//                         //                 Icons.phone,
//                         //                 size: 25,
//                         //               ),
//                         //             ),
//                         //           ),
//                         //           value: _countryCode,
//                         //           onChanged: (String? newValue) {
//                         //             _countryCode = newValue ?? "+961";
//                         //           },
//                         //           items: [
//                         //             DropdownMenuItem<String>(
//                         //               value: "+966",
//                         //               child: Text("+966"),
//                         //             ),
//                         //             DropdownMenuItem<String>(
//                         //               value: "+20",
//                         //               child: Text("+20"),
//                         //             ),
//                         //             DropdownMenuItem<String>(
//                         //               value: "+1",
//                         //               child: Text("+1"),
//                         //             ),
//                         //           ]),
//                         //     ),
//                         //     Expanded(
//                         //       flex: 6,
//                         //       child: TextFormField(
//                         //         keyboardType: TextInputType.emailAddress,
//                         //         textInputAction: TextInputAction.next,
//                         //         cursorColor: kPrimaryColor,
//                         //         onSaved: (newValue) => email = newValue!,
//                         //         onChanged: (value) {
//                         //           email = value;
//                         //         },
//                         //         decoration: InputDecoration(
//                         //           filled: true,
//                         //           fillColor: null,
//                         //           labelText: "رقم الهاتف",
//                         //           contentPadding: EdgeInsets.symmetric(
//                         //             vertical: 10,
//                         //             horizontal: 20,
//                         //           ),
//                         //           border: OutlineInputBorder(
//                         //               borderRadius: BorderRadius.all(
//                         //                   Radius.circular(20))),
//                         //           enabledBorder: OutlineInputBorder(
//                         //             borderSide: BorderSide(
//                         //               color: Colors.red,
//                         //               width: 1,
//                         //             ),
//                         //             borderRadius: BorderRadius.all(
//                         //               Radius.circular(20),
//                         //             ),
//                         //           ),
//                         //           focusedBorder: OutlineInputBorder(
//                         //               borderSide: BorderSide(
//                         //                   color: Colors.blue, width: 2),
//                         //               borderRadius: BorderRadius.all(
//                         //                   Radius.circular(20))),
//                         //           floatingLabelBehavior:
//                         //               FloatingLabelBehavior.auto,
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ],
//                         // ),

//                         //
//                         //

//                         SizedBox(height: 40.0),
//                         Container(
//                           decoration:
//                               ThemeHelper().buttonBoxDecoration(context),
//                           child: ElevatedButton(
//                             style: ThemeHelper().buttonStyle(),
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.fromLTRB(40, 10, 40, 10),
//                               child: Text(
//                                 "إرسال".toUpperCase(),
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           ForgotPasswordVerificationPage()),
//                                 );
//                               }
//                             },
//                           ),
//                         ),
//                         SizedBox(height: 30.0),
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(text: "تذكرت كلمة المرور ؟ "),
//                               TextSpan(
//                                 text: 'دخول',
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => Lognin()),
//                                     );
//                                   },
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
