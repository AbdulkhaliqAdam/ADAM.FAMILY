import 'package:adam_family/components/authentication_repository.dart';
import 'package:adam_family/screens/pages/profile/user_model.dart';
import 'package:adam_family/screens/pages/profile/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  /// Step 3 - Get User Email and pass to UserRepository to fetch user record.

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("خطأ", "سجل الدخول للمتابعة");
    }

    //يتم تفعيلها
    //  final phoneNo = _authRepo.firebaseUser.value?.phoneNumber;
    //      if (phoneNo != null) {
    //     return _userRepo.getUserDetails(phoneNo);
    //   } else {
    //     Get.snackbar("خطأ", "سجل الدخول للمتابعة");
    //   }
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }
}
