import 'package:flutter/material.dart';
import 'package:adam_family/screens/first_screen.dart';
import 'package:adam_family/widgets/main/home_banner.dart';
import 'package:adam_family/widgets/main/icon_info.dart';

class MainSection extends StatelessWidget {
  static const String screenRoute = 'main_section';

  const MainSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirstScreen(
        mainSection: SingleChildScrollView(
      child: Column(children: [
        HomeBanner(),
        IconInfo(),
      ]),
    ));
  }
}
