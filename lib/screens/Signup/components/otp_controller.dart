import 'package:adam_family/components/authentication_repository.dart';
import 'package:adam_family/components/firebase_auth_methods.dart';
import 'package:adam_family/screens/home.dart';
import 'package:adam_family/widgets/w_new/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    // isVerified ? Get.offAll(const Dashboard()) : Get.back();
    isVerified ? Get.offAll(const Home()) : Get.back();
  }
}
