import 'package:flutter/material.dart';
import 'package:adam_family/constants.dart';
import 'package:adam_family/widgets/menu/add_image_screen.dart';
import 'package:adam_family/widgets/menu/contact_info.dart';
import 'package:adam_family/widgets/menu/logo.dart';
import 'package:adam_family/widgets/menu/contact_us.dart';

class SideMenuSection extends StatelessWidget {
  const SideMenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            logo(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    AddImageScreen(),
                    Divider(),
                    ContactInfo(),
                    Divider(),
                    ContactUs(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
