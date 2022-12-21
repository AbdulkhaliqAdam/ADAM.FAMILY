import 'package:adam_family/screens/login/login_screen.dart';
import 'package:adam_family/theme_service.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lognin extends StatefulWidget {
  const Lognin({Key? key}) : super(key: key);
  static String routeName = "/lognin";

  @override
  State<Lognin> createState() => _LogninState();
}

class _LogninState extends State<Lognin> {
  var obscureText = true;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    const moonIcon = CupertinoIcons.moon_stars;

    return Scaffold(
      body: LoginScreen(),
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
                onPressed: () {ThemeService().changeTheme();setState(() {obscureText = !obscureText;});},
                shape: CircleBorder(side: BorderSide(width: 1, color: Colors.blue),),
                padding: const EdgeInsets.all(10.0),
                child:  obscureText
                  ? const Icon(
                      moonIcon,
                      color: Colors.black,
                    )
                  : const Icon(
                      moonIcon,
                      color: Colors.lightBlue,
                    )
                ),
            RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(
                  side: BorderSide(width: 1, color: Colors.blue),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.settings, color: Colors.blue)),
            RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.blue),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.account_box, color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
