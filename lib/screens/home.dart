import 'package:adam_family/components/authentication_repository.dart';
import 'package:adam_family/screens/Signup/signup_screen.dart';
import 'package:adam_family/screens/first_screen.dart';
import 'package:adam_family/screens/login/login_screen.dart';
import 'package:adam_family/theme_service.dart';
import 'package:adam_family/widgets/main/home_banner.dart';
import 'package:adam_family/widgets/main/icon_info.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  static String routeName = "/Home";

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  late User signedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    const moonIcon = CupertinoIcons.moon_stars;
    return Scaffold(
      body: FirstScreen(
          mainSection: SingleChildScrollView(
        child: Column(children: [
          HomeBanner(),
          IconInfo(),
        ]),
      )),
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          alignment: Alignment.bottomLeft,
          ringColor: Colors.blue.withOpacity(0.4),
          ringDiameter: 250.0,
          ringWidth: 50.0,
          fabSize: 40.0,
          fabElevation: 8.0,
          fabIconBorder: CircleBorder(),
          fabColor: Colors.blueAccent,
          fabOpenIcon: Icon(Icons.contact_phone, color: Colors.white),
          fabCloseIcon: Icon(Icons.close, color: Colors.white),
          fabMargin: const EdgeInsets.all(16.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          onDisplayChange: (isOpen) {
            print(isOpen);
          },
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                var controller;
                controller.fabKey.currentState!.close();
              },
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.blue),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.home, color: Colors.blue),
            ),
            RawMaterialButton(
                onPressed: () {
                  ThemeService().changeTheme();
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                shape: CircleBorder(
                  side: BorderSide(width: 1, color: Colors.blue),
                ),
                padding: const EdgeInsets.all(10.0),
                child: obscureText
                    ? const Icon(
                        moonIcon,
                        color: Colors.black,
                      )
                    : const Icon(
                        moonIcon,
                        color: Colors.lightBlue,
                      )),
            RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(
                  side: BorderSide(width: 1, color: Colors.blue),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.settings, color: Colors.blue)),
            RawMaterialButton(
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.blue),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.logout, color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
