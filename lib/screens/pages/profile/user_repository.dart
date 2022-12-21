/*
    =======
    Todo Step - 2 [User Repository to perform Database Operations]
    =======
*/

//

import 'package:adam_family/screens/pages/profile/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Store user in FireStore
  createUser(UserModel user) async {
    await _db
        .collection("المستخدمين")
        .add(user.toJosn())
        .whenComplete(
          () => Get.snackbar("عظيم", "تم إنشاء الحساب",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("خطأ", "هناك خطأ. حاول مرة أخرى",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  /// Step 2 - Fetch All Users Or User details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db
        .collection("المستخدمين")
        .where("البريد الألكترونى", isEqualTo: email)
        .get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot =
        await _db.collection("المستخدمين").where("البريد الألكترونى").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}
