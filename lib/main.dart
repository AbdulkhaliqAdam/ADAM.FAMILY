import 'package:adam_family/components/authentication_repository.dart';
import 'package:adam_family/constants.dart';
import 'package:adam_family/firebase_options.dart';
import 'package:adam_family/routes.dart';
import 'package:adam_family/screens/Welcome/welcome_screen.dart';
import 'package:adam_family/screens/home.dart';
import 'package:adam_family/screens/login/components/login_form.dart';
import 'package:adam_family/screens/login/login_screen.dart';
import 'package:adam_family/screens/login/lognin.dart';
import 'package:adam_family/theme_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await FacebookAuth.i.webAndDesktopInitialize(
  //     appId: "882709859768777", // Replace with your app id
  //     cookie: true,
  //     xfbml: true,
  //     version: "v12.0",
  //   );
  // }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyAm-yjNLCFVOkC14z5r4FXjicO1kps6doY",
  //     appId: "1:404604761861:android:5b3366a14ce001df8ce96c",
  //     messagingSenderId: "404604761861",
  //     projectId: "adam--family",
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // const MyApp({Key? key}) : super(key: key);

  final _auth = FirebaseAuth.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      // theme: ThemeService().lightTheme,
      theme: ThemeData.light().copyWith(
          canvasColor: kBgColor,
          primaryColor: kPrimaryColor2,
          textTheme: GoogleFonts.poppinsTextTheme()
              .apply(bodyColor: Colors.black)
              .copyWith(
                bodyText1: TextStyle(color: kBodyTextColor),
                bodyText2: TextStyle(color: kBodyTextColor),
              )),
      debugShowCheckedModeBanner: false,
      title: 'عائلة آل آدم - Adam’s Family ',
      // defaultTransition: Transition.leftToRightWithFade,
      // transitionDuration: const Duration(milliseconds: 500),

      home: const CircularProgressIndicator(),
      // initialRoute:
      //     _auth.currentUser != null ? Home.routeName : Lognin.routeName,
      // initialRoute: Lognin.routeName,
      // routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String routeName = "/my_home_page";
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreen(),
      // floatingActionButton: Builder(
      //   builder: (context) => FabCircularMenu(
      //     alignment: Alignment.bottomLeft,
      //     ringColor: Colors.blue.withOpacity(0.4),
      //     ringDiameter: 250.0,
      //     ringWidth: 50.0,
      //     fabSize: 40.0,
      //     fabElevation: 8.0,
      //     fabIconBorder: CircleBorder(),
      //     fabColor: Colors.blueAccent,
      //     fabOpenIcon: Icon(Icons.contact_phone, color: Colors.white),
      //     fabCloseIcon: Icon(Icons.close, color: Colors.white),
      //     fabMargin: const EdgeInsets.all(16.0),
      //     animationDuration: const Duration(milliseconds: 800),
      //     animationCurve: Curves.easeInOutCirc,
      //     onDisplayChange: (isOpen) {
      //       print(isOpen);
      //     },
      //     children: <Widget>[
      //       RawMaterialButton(
      //         onPressed: () {
      //           var controller;
      //           controller.fabKey.currentState!.close();
      //         },
      //         shape: CircleBorder(
      //           side: BorderSide(width: 1, color: Colors.blue),
      //         ),
      //         padding: const EdgeInsets.all(0.05),
      //         child: Image.asset(
      //           'assets/images/Face.png',
      //           scale: 11.5,
      //         ),
      //       ),
      //       RawMaterialButton(
      //           onPressed: () {},
      //           shape: CircleBorder(
      //             side: BorderSide(width: 1, color: Colors.blue),
      //           ),
      //           padding: const EdgeInsets.all(10.0),
      //           child: Icon(Icons.email, color: Colors.blue)),
      //       RawMaterialButton(
      //           onPressed: () {},
      //           shape: CircleBorder(
      //             side: BorderSide(width: 1, color: Colors.blue),
      //           ),
      //           padding: const EdgeInsets.all(10.0),
      //           child: Icon(Icons.settings, color: Colors.blue)),
      //       RawMaterialButton(
      //         onPressed: () {},
      //         shape: CircleBorder(
      //           side: BorderSide(width: 1, color: Colors.blue),
      //         ),
      //         padding: const EdgeInsets.all(2.0),
      //         child: Image.asset(
      //           'assets/images/phone.png',
      //           scale: 26,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User?>();

//     if (firebaseUser != null) {
//       return const Home();
//     }
//     return const Home();
//   }
// }
