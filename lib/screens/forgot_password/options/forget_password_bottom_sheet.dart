import 'package:adam_family/constants.dart';
import 'package:adam_family/screens/forgot_password/forget_password_mail.dart';
import 'package:adam_family/screens/forgot_password/options/bottom_sheet_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tForgetPasswordTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(tForgetPasswordSubTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
              title: 'E-Mail',
              subTitle: tResetViaEmail,
              btnIcon: Icons.mail_outline_rounded,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              onTap: () {},
              title: 'Phone No',
              subTitle: tResetViaPhone,
              btnIcon: Icons.mobile_friendly_rounded,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
