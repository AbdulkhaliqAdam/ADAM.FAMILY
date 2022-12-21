import 'package:adam_family/main.dart';
import 'package:adam_family/screens/Welcome/welcome_screen.dart';
import 'package:adam_family/screens/first_screen.dart';
import 'package:adam_family/screens/forgot_password/forgot_password_page.dart';
import 'package:adam_family/screens/home.dart';
import 'package:adam_family/screens/login/components/login_form.dart';
import 'package:adam_family/screens/login/login_screen.dart';
import 'package:adam_family/screens/first_screen.dart';
import 'package:adam_family/screens/login/lognin.dart';
import 'package:adam_family/screens/pages/chat_screen.dart';
import 'package:adam_family/widgets/main/home_banner.dart';
import 'package:adam_family/widgets/main/icon_info.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  MyHomePage.routeName: (context) => MyHomePage(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  // ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
  FirstScreen.routeName: (context) => FirstScreen(
        mainSection: SingleChildScrollView(
          child: Column(children: [
            HomeBanner(),
            IconInfo(),
          ]),
        ),
      ),
  Lognin.routeName: (context) => Lognin(),
  ChatScreen.routeName: (context) => ChatScreen(),
  Home.routeName: (context) => Home(),

  //ForgotScreen.routeName: (context) => ForgotScreen(),
};
