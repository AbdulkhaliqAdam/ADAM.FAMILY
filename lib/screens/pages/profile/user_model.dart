/*
    =======
    Todo Step - 1 [Create Model]
    =======
*/

//
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  // final String rePassword;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password,
    // required this.rePassword,
  });

  toJosn() {
    return {
      "الاسم بالكامل": fullName,
      "البريد الألكترونى": email,
      "رقم الهاتف": phoneNo,
      "كلمة المرور": password,
      // "تكرار كلمة المرور": rePassword,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        email: data["كلمة المرور"],
        password: data["كلمة المرور"],
        // rePassword: data["تكرار كلمة المرور"],
        fullName: data["الاسم بالكامل"],
        phoneNo: data["رقم الهاتف"]);
  }
}
