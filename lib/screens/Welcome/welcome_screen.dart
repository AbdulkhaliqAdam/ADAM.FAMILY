import 'dart:async';

import 'package:adam_family/constants.dart';
import 'package:adam_family/constants/images_constant.dart';
import 'package:adam_family/screens/login/lognin.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({
    Key? key,
  }) : super(key: key);
  //  WelcomeScreen({Key? key, required this.title}) : super(key: key);
  static String routeName = "/welcome_screen";

  // final String title;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isVisible = false;

  _WelcomeScreenState() {
    new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Lognin()),
            (route) => false);
      });
    });

    new Timer(Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColor
          ],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 2500),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Text(
                "مرحبًا بك فى عائلة آل آدم",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(235, 208, 3, 71),
                  // color: Color.fromARGB(224, 8, 115, 238),
                ),
              ),
              SizedBox(height: defaultPadding * 2),
              Container(
                height: 300.0,
                width: 300.0,
                child: Center(
                  child: ClipOval(child: Image.asset(iTree)),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 2.0,
                        offset: Offset(5.0, 3.0),
                        spreadRadius: 2.0,
                      )
                    ]),
              ),
              SizedBox(height: defaultPadding * 2),
              Text(
                "               عائلة آل آدم \n إحدى أنسال عائلة آل قايد العريقة",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(235, 208, 3, 71),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
