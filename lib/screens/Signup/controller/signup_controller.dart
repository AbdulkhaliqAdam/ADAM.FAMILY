import 'package:adam_family/components/authentication_repository.dart';
import 'package:adam_family/screens/pages/profile/user_model.dart';
import 'package:adam_family/screens/pages/profile/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  final rePassword = TextEditingController();

  final userRepo = Get.put(UserRepository());

  /// This func will be used to register user with [EMAIL] & [Password]
  ///
  ///  1-
//  void registerUser(String email, String password) {
//     String? error = AuthenticationRepository.instance
//         .createUserWithEmailAndPassword(email, password) as String?;
//     if (error != null) {
//       Get.showSnackbar(GetSnackBar(message: error.toString()));
//     }
//   }

  //  2-
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  //Get phoneNo from user (Screen) and pass it to Auth Repository for Firebase Authentication

  Future<void> creatUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
