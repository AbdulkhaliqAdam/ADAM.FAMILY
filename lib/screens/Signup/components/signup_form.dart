import 'dart:math';

import 'package:adam_family/components/form_error.dart';
import 'package:adam_family/constants/images_constant.dart';
import 'package:adam_family/screens/Signup/components/otp_screen.dart';
import 'package:adam_family/screens/Signup/controller/signup_controller.dart';
import 'package:adam_family/screens/first_screen.dart';
import 'package:adam_family/screens/home.dart';
import 'package:adam_family/screens/login/login_screen.dart';
import 'package:adam_family/screens/login/lognin.dart';
import 'package:adam_family/screens/pages/profile/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/firebase_auth_methods.dart';
import '../../../constants.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  // final phoneNo = TextEditingController();

  var obscureText = true;
  final _formKey = GlobalKey<FormState>();
  // final controller = Get.put(signUpController());
  late FlCountryCodePicker countryPicker;
  final TextEditingController phoneNumberController = TextEditingController();
  CountryCode? countryCode;

  final _auth = FirebaseAuth.instance;
  // String _countryCode = "+20";
  // List<String> itemsList = ['+20', '+966'];
  // String? selectedItem = '+20';
  late String name;
  late String email;
  late String phone;
  late String password;
  late String repassword;
  bool remember = false;
  bool showSpinner = false;
  bool checkedValue = false;
  bool checkboxValue = false;
  final List<String> errors = [];
  late User signedInUser;
  late final Rx<User?> firebaseUser;

  @override
  void initState() {
    final favoriteCountries = ['EG', 'SA'];
    countryPicker = FlCountryCodePicker(
        favorites: favoriteCountries,
        favoritesIcon: const Icon(
          Icons.star,
          color: Colors.amber,
        ));
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   phoneController.dispose();
  // }

  // void phoneSignIn() {
  //   FirebaseAuthMethods(FirebaseAuth.instance)
  //       .phoneSignIn(context, phoneController.text);
  // }

  // void getCurrentUser() {
  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     signedInUser = user;
  //   }
  // }

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (newValue) => name = newValue!,
              controller: controller.fullName,
              decoration: InputDecoration(
                filled: true,
                fillColor: null,
                labelText: " الاسم بالكامل",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    Icons.person,
                  ),
                ),
              ),
            ),

            SizedBox(height: defaultPadding / 1.5),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: controller.email,
              cursorColor: kPrimaryColor,
              onSaved: (newValue) => email = newValue!,
              // onChanged: (value) {
              //   email = value;
              //   if (value.isNotEmpty) {
              //     removeError(error: kEmailNullError);
              //   } else if (emailValidatorRegExp.hasMatch(value)) {
              //     removeError(error: kInvalidEmailError);
              //   }
              //   return null;
              // },
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     addError(error: kEmailNullError);
              //     return "";
              //   } else if (!emailValidatorRegExp.hasMatch(value)) {
              //     addError(error: kInvalidEmailError);
              //     return "";
              //   }
              //   return null;
              // },
              decoration: InputDecoration(
                filled: true,
                fillColor: null,
                labelText: "البريد الألكترونى ",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.email_rounded),
                ),
              ),
            ),
            SizedBox(height: defaultPadding / 1.5),

            Row(
              children: [
                // Expanded(
                //   flex: 3,
                //   child: SizedBox(
                //     width: 200,
                //     child: DropdownButtonFormField<String>(
                //         decoration: InputDecoration(
                //           filled: true,
                //           fillColor: null,
                //           contentPadding: EdgeInsets.symmetric(
                //             vertical: 10,
                //             horizontal: 20,
                //           ),
                //           border: OutlineInputBorder(
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(20))),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //               color: Colors.red,
                //               width: 1,
                //             ),
                //             borderRadius: BorderRadius.all(
                //               Radius.circular(20),
                //             ),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: Colors.blue, width: 2),
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(20))),
                //           floatingLabelBehavior: FloatingLabelBehavior.auto,
                //         ),
                //         value: selectedItem,
                //         items: itemsList
                //             .map((item) => DropdownMenuItem(
                //                   value: item,
                //                   child: Text(item),
                //                 ))
                //             .toList(),
                //         onChanged: (item) =>
                //             setState(() => selectedItem = item)),
                //   ),
                // ),
                Expanded(
                  flex: 8,
                  child: TextFormField(
                    // maxLines: 1,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    cursorColor: kPrimaryColor,
                    onSaved: (newValue) => phone = newValue!,
                    onChanged: (value) {
                      phone = value;
                    },
                    // controller: controller.phoneNo,
                    controller: controller.phoneNo,
                    // controller: controller.phoneNo,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: null,
                        labelText: " أدخل رقم الهاتف",
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
                        // icon: Icon(Icons.phone_android_rounded),
                        prefixIcon: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 6),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.phone_android_rounded),
                              GestureDetector(
                                onTap: () async {
                                  final code = await countryPicker.showPicker(
                                      context: context);
                                  setState(() {
                                    countryCode = code;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      child: countryCode != null
                                          ? countryCode!.flagImage
                                          : null,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                            countryCode?.dialCode ?? "+20")),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),

            // TextFormField(
            //   keyboardType: TextInputType.phone,
            //   textInputAction: TextInputAction.next,
            //   cursorColor: kPrimaryColor,
            //   onSaved: (newValue) => phone = newValue!,
            //   onChanged: (value) {
            //     password = value;
            //     if (value.isNotEmpty) {
            //       removeError(error: kEmailNullError);
            //     } else if (emailValidatorRegExp.hasMatch(value)) {
            //       removeError(error: kInvalidEmailError);
            //     }
            //     return null;
            //   },
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       addError(error: kPhoneNumberNullError);
            //       return "";
            //     } else if (!emailValidatorRegExp.hasMatch(value)) {
            //       addError(error: kPhoneNumberNullError);
            //       return "";
            //     }
            //     return null;
            //   },
            //   controller: phoneController,
            //   maxLength: 11,
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: null,
            //     labelText: " رقم الهاتف",
            //     contentPadding: EdgeInsets.symmetric(
            //       vertical: 10,
            //       horizontal: 20,
            //     ),
            //     border: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(20))),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.red,
            //         width: 1,
            //       ),
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(20),
            //       ),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.blue, width: 2),
            //         borderRadius: BorderRadius.all(Radius.circular(20))),
            //     prefix: Padding(padding: EdgeInsets.all(4), child: Text('+2')),
            //     floatingLabelBehavior: FloatingLabelBehavior.auto,
            //     prefixIcon: Padding(
            //       padding: const EdgeInsets.all(8),
            //       child: Icon(Icons.phone),
            //     ),
            //   ),
            // ),

            SizedBox(height: defaultPadding / 1.5),
            TextFormField(
              textInputAction: TextInputAction.done,

              onSaved: (newValue) => password = newValue!,

              onChanged: (value) {
                // {
                //             if(!(value!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(value)){
                //               return "Enter a valid email address";
                //             }
                //             return null;
                //           },

                if (value.isNotEmpty) {
                  removeError(error: kPassNullError);
                } else if (value.length >= 8) {
                  removeError(error: kShortPassError);
                }
                return null;
              },
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     addError(error: kPassNullError);
              //     return "";
              //   } else if (value.length < 8) {
              //     addError(error: kShortPassError);
              //     return "";
              //   }
              //   return null;
              // },
              cursorColor: kPrimaryColor,
              controller: controller.password,
              obscureText: obscureText,
              decoration: InputDecoration(
                filled: true,
                fillColor: null,
                labelText: " كلمة المرور",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.lock),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: obscureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(
                          Icons.visibility,
                          color: Color(0XFF4FBF26),
                        ),
                ),
              ),
            ),
            SizedBox(height: defaultPadding / 1.5),
            TextFormField(
              textInputAction: TextInputAction.done,
              onSaved: (newValue) => repassword = newValue!,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kPassNullError);
                } else if (value.isNotEmpty && password == repassword) {
                  removeError(error: kMatchPassError);
                }
                repassword = value;
              },
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     addError(error: kPassNullError);
              //     return "";
              //   } else if (password != value) {
              //     addError(error: kMatchPassError);
              //     return "";
              //   }
              //   return null;
              // },
              cursorColor: kPrimaryColor,
              obscureText: obscureText,
              controller: controller.rePassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: null,
                labelText: " تأكيد كلمة المرور",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.lock_reset),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: obscureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(
                          Icons.visibility,
                          color: Color(0XFF4FBF26),
                        ),
                ),
              ),
            ),
            SizedBox(height: defaultPadding / 1.5),
            FormField<bool>(
              builder: (state) {
                return Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: checkboxValue,
                            onChanged: (value) {
                              setState(() {
                                checkboxValue = value!;
                                state.didChange(value);
                              });
                            }),
                        Text(
                          "الموافقة على جميع القواعد والشروط",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    // Container(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     state.errorText ?? '',
                    //     textAlign: TextAlign.left,
                    //     style: TextStyle(
                    //       color: Theme.of(context).errorColor,
                    //       fontSize: 12,
                    //     ),
                    //   ),
                    // )
                  ],
                );
              },
              // validator: (value) {
              //   if (!checkboxValue) {
              //     return 'You need to accept terms and conditions';
              //   } else {
              //     return null;
              //   }
              // },
            ),
            SizedBox(height: defaultPadding / 1.5),
            FormError(errors: errors),
            Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 90),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade400),
              child: MaterialButton(
                onPressed: () async {
                  if (countryCode != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "${countryCode!.dialCode}-${controller.phoneNo.text.trim()}")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("من فضلك أختر مفتاح البلد")));
                  }

                  if (_formKey.currentState!.validate()) {
                    // Email And Password
                    SignUpController.instance.registerUser(
                        controller.email.text.trim(),
                        controller.password.text.trim());

                    // //Phone
                    // SignUpController.instance.phoneAuthentication(
                    //   controller.phoneNo.text.trim(),
                    // );
                    // Get.to(() => const OTPScreen());

                    //     //
                    // // Todo:Step - 3 [Get User and Pass it to Controller]
                    // final user = UserModel(
                    //     email: controller.email.text.trim(),
                    //     password: controller.password.text.trim(),
                    //     // rePassword: controller.rePassword.text.trim(),
                    //     fullName: controller.fullName.text.trim(),
                    //     phoneNo: controller.phoneNo.text.trim());
                    // SignUpController.instance.creatUser(user);
                    // //
                  }
                },
                child: Text(
                  "تسجيل حساب",
                ),
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: defaultPadding / 1.5),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                // if (_formKey.currentState!.validate()) {
                //   // signUpController.instance.registerUser(
                //   //     controller.email.text.trim(),
                //   //     controller.password.text.trim());
                //   signUpController.instance
                //       .phoneAuthentication(controller.phoneNo.text.trim());
                // }

                // context
                //     .read<FirebaseAuthMethods>()
                //     .phoneSignIn(context, phoneController.text);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Lognin();
                }));

                // Navigator.pushNamed(context, Lognin.routeName);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return Home();
                //     },
                //   ),
                // );
              },
            ),
            SizedBox(height: defaultPadding / 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(iFacebook),
                  iconSize: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(iGoogle),
                  iconSize: 35,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            //NoAccountText(),
          ],
        ),
      ),
    );
  }
}
