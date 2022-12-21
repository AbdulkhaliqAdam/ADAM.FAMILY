import 'package:adam_family/components/firebase_auth_methods.dart';
import 'package:adam_family/main.dart';
import 'package:adam_family/screens/Signup/controller/signup_email_password_failure.dart';
import 'package:adam_family/screens/Welcome/welcome_screen.dart';
import 'package:adam_family/screens/first_screen.dart';
import 'package:adam_family/screens/home.dart';
import 'package:adam_family/screens/login/controller/login_email_password_failure.dart';
import 'package:adam_family/screens/login/lognin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Varibales
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    // Future.delayed(const Duration(seconds: 4));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        // ? Get.offAll(() => const WelcomeScreen())
        ? Get.offAll(() => const MyHomePage())
        : Get.offAll(() => const Home());
  }

  // Phone Authentecation
  loginWithPhoneNo(String phoneNumber) async {
    try {
      await _auth.signInWithPhoneNumber(phoneNumber);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'رقم هاتف غير صالح') {
        Get.snackbar('خطأ', 'هاتف غير صالح');
      }
    } catch (_) {
      Get.snackbar('خطأ', 'هناك خطأ');
    }
  }

  Future<void> phoneAuthentication(
    String phoneNo,
  ) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendingToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'رقم هاتف غير صالح') {
          Get.snackbar('خطأ', 'هناك خطأ حاول مرة أخرى');
        } else {
          Get.snackbar('خطأ', 'هناك خطأ حاول مرة أخرى');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credential.user != null ? true : false;
  }

  // Future<String> createUserWithEmailAndPassword(
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Home())
          : Get.to(() => MyHomePage());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPION- ${ex.message}');
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPION- ${ex.message}');
      throw ex;
    }
  }

  //Login Email And Pass

  // Future<String?> loginWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
  //     return ex.message;
  //   } catch (_) {
  //     const ex = LogInWithEmailAndPasswordFailure();
  //     return ex.message;
  //   }
  //   return null;
  // }

  //

  // Future<void> loginWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //   } catch (_) {}
  // }

  //LogOut
  Future<void> logout() async => await _auth.signOut();

  // Future<void> chat() async => await _auth.chatScreen();
}
