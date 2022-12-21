import 'package:flutter/material.dart';

//Colors
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const kSecondaryColor = [
  Color(0xFF3594DD),
  Color(0xFF4563DB),
  Color(0xFF5036D5),
  Color(0xFF5816D0),
];
const kPrimaryColor2 = Color(0xFF3799FB);
const kSecondaryColor2 = Color(0xFF2B374F);
const kDarkColor = Color(0xFF000714);
const kBodyTextColor = Color(0xFF979DAC);
const kBgColor = Color(0xFF001233);
const kDefaultPadding = 20.0;

const tPrimaryColor = Color(0xFFFFE400);
const tSecondaryColor = Color(0xFF272727);
const tAccentColor = Color(0xFF001BFF);

const tWhiteColor = Colors.white;
const tDarkColor = Color(0xff000000);
const tCardBgColor = Color(0xFFF7F6F1);

const tOnBoardingPage1Color = Colors.white;
const tOnBoardingPage2Color = Color(0xfffddcdf);
const tOnBoardingPage3Color = Color(0xffffdcbd);

// Sized
const tDefaultSize = 30.0;
const tSplashContainerSize = 30.0;
const tButtonHeight = 15.0;
const tFormHeight = 30.0;

const tDashboardPadding = 20.0;
const tDashboardCardPadding = 10.0;

// TextStrings
const String tOtpTitle = "CO\nDE";
const String tOtpSubTitle = "Verification";
const String tOtpMessage = "Enter the Verification code sent at ";

const String tLoginTitle = "Welcome back ";
const String tLoginSubTitle = "Make it work, make it right, make it fast ";
const String tRememberMe = "Remember Me? ";
const String tDontHaveAnAccount = "Don’t have an Account? ";

const String tSignUpTitle = "Get on Board! ";
const String tSignUpSubTitle = "Creat your Profile to Start Your Account ";
const String tAlreadyHaveAnAccount = "Already have an Account? ";

const String tForgetPasswordTitle = "Make Selection ";
const String tForgetPasswordSubTitle = "Slect one of the option ";
const String tResetViaEmail = "Rest via Mail Verification ";
const String tResetViaPhone = "Rest via Phone Verification ";

const String tForgetPhoneSubTitle = "Enter your Phone No ";
const String tForgetMailSubTitle = "Enter your Email ";

const String tDashboardTitle = "hey , Coding with T ";
const String tDashboardHeading = "Explore Courses ";
const String tDashboardSearch = "Search .... ";
const String tDashboardBannerTitle1 = "Android for Beginners ";
const String tDashboardBannerTitle2 = "JAVA ";
const String tDashboardBannerSubTitle = "10 lessons";
const String tDashboardButton = "View All ";
const String tDashboardTopCourses = "Top Courses";

const double defaultPadding = 16.0;

const kAnimationDuration = Duration(milliseconds: 200);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0]+\-[a-zA-Z]+');
const String kEmailNullError = 'من فضلك أدخل البريد الألكترونى';
const String kInvalidEmailError = ' بريد غير متاح';
const String kPassNullError = 'من فضلك أدخل كلمة المرور';
const String kShortPassError = 'كلمة المرور قصيرة جدًا';
const String kMatchPassError = ' ماتش';
const String kNameNullError = 'من فضلك أدخل اسمك ';
const String kPhoneNumberNullError = 'من فضلك أدخل رقم هاتفك';
const String kAdressNullError = 'من فضلك أدخل العنوان';

final headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

/* -- App Text Strings -- */

// -- GLOBAL Texts
const String tNext = "Next";
const String tLogin = "Login";
const String tEmail = "E-Mail";
const String tSignup = "Signup";
const String tPhoneNo = "Phone No";
const String tPassword = "Password";
const String tFullName = "Full Name";
const String tForgetPassword = "Forget Password";
const String tSignInWithGoogle = "Sign-In with Google";

// -- Splash Screen Text
const String tAppName = ".appable/";
const String tAppTagLine = "Learn To Code. \nFree For Everyone";

// -- On Boarding Text
const String tOnBoardingTitle1 = "Build Awesome Apps";
const String tOnBoardingTitle2 = "Learn from YouTube";
const String tOnBoardingTitle3 = "Get Code & Resources";
const String tOnBoardingSubTitle1 =
    "Let's start your journey with us on this amazing and easy platform.";
const String tOnBoardingSubTitle2 =
    "Get Video Tutorials of each topic to learn things easily.";
const String tOnBoardingSubTitle3 =
    "Save time by just copy pasting complete apps you learned from videos.";
const String tOnBoardingCounter1 = "1/3";
const String tOnBoardingCounter2 = "2/3";
const String tOnBoardingCounter3 = "3/3";

// -- Welcome Screen Text
const String tWelcomeTitle = "Build Awesome Apps";
const String tWelcomeSubTitle =
    "Let's put your creativity on the development highway.";

//Profile
const String tProfile = "الملف الشخصى";
const String tEditProfile = "تعديل الملف الشخصى";
const String tLogoutDialogHeading = "خروج ";
const String tProfileHeading = "Coding with T ";
const String tProfileSubHeading = " superAdmin@codingwitht.com";
//Menu
const String tMenu5 = "tLogout";
const String tMenu1 = "الضبط";
const String tMenu4 = "معلومات";
const String tMenu2 = "تفاصيل";
const String tMenu3 = "مدير المستخدم";
//Update Profile Screen
const String tDelete = "حذف ";
const String tJoined = " تم التسجيل";
const String tJoinedAt = " 31-10-2022  ";
