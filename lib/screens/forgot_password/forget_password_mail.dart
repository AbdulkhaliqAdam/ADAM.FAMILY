import 'package:adam_family/constants.dart';
import 'package:adam_family/constants/images_constant.dart';
import 'package:adam_family/screens/Signup/components/otp_screen.dart';
import 'package:adam_family/screens/forgot_password/options/form_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: tDefaultSize * 4),
                FormHeaderWidget(
                  image: iTree,
                  title: tForgetPassword.toUpperCase(),
                  subTitle: tForgetMailSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: tFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: null,
                          // label: Text('البريد الألكترونى'),
                          labelText: " البريد الألكترونى",
                          hintText: 'أدخل البريد الألكترونى المرتبط بالحساب',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Icon(Icons.mail_outline_rounded),
                          ),
                        ),

                        // InputDecoration(
                        //     label: Text('البريد الألكترونى'),
                        //     hintText: 'أدخل البريد الألكترونى المرتبط بالحساب',
                        //     prefixIcon: Icon(Icons.mail_outline_rounded)),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const OTPScreen());
                              },
                              child: const Text('التالى'))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
