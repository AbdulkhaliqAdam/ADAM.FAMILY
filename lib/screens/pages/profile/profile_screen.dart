import 'package:adam_family/constants.dart';
import 'package:adam_family/constants/images_constant.dart';
import 'package:adam_family/screens/pages/profile/profile_menu.dart';
import 'package:adam_family/screens/pages/profile/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          tProfile,
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(image: AssetImage(iTree))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Icon(
                          LineAwesomeIcons.alternate_pencil,
                          size: 18.0,
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tProfileHeading,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                tProfileSubHeading,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(tEditProfile,
                      style: TextStyle(color: tDarkColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: 'الضبط',
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'التفاصيل',
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'مدير المستخدم',
                icon: LineAwesomeIcons.user_check,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'معلومات',
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'خروج',
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
