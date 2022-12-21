import 'package:adam_family/components/background.dart';
import 'package:adam_family/components/firebase_auth_methods.dart';
import 'package:adam_family/components/form_error.dart';
import 'package:adam_family/components/no_account_text.dart';
import 'package:adam_family/constants.dart';
import 'package:adam_family/constants/images_constant.dart';
import 'package:adam_family/helper/keyboard.dart';
import 'package:adam_family/screens/Signup/singup.dart';
import 'package:adam_family/screens/first_screen.dart';
import 'package:adam_family/screens/forgot_password/options/bottom_sheet_button_widget.dart';
import 'package:adam_family/screens/forgot_password/forgot_password_page.dart';
import 'package:adam_family/screens/forgot_password/options/forget_password_bottom_sheet.dart';
import 'package:adam_family/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  static String routeName = "/login_form";
  static const id = 'phonescreen';

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  late String email;
  late String phone;
  late String password;
  bool remember = false;
  bool showSpinner = false;
  final List<String> errors = [];

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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

  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void phoneSignIn() {
    FirebaseAuthMethods(FirebaseAuth.instance).phoneSignIn(
      context,
      phoneController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (newValue) => email = newValue!,
            onChanged: (value) {
              email = value;
              phone = value;
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "";
              }
              return null;
            },
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: null,
              labelText: "اسم المستخدم",
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
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              onSaved: (newValue) => password = newValue!,
              onChanged: (value) {
                password = value;
                if (value.isNotEmpty) {
                  removeError(error: kPassNullError);
                } else if (value.length >= 8) {
                  removeError(error: kShortPassError);
                }
                return null;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: kPassNullError);
                  return "";
                } else if (value.length < 8) {
                  addError(error: kShortPassError);
                  return "";
                }
                return null;
              },
              cursorColor: kPrimaryColor,
              controller: passwordController,
              obscureText: obscureText,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: null,
                  labelText: "كلمة المرور",
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
                    padding: const EdgeInsets.all(defaultPadding),
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
                            ))),
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  activeColor: Color.fromARGB(255, 35, 155, 235),
                  onChanged: (Value) {
                    setState(() {
                      remember = Value!;
                    });
                  }),
              Text('تذكرنى'),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    ForgetPasswordScreen.buildShowModalBottomSheet(context);

                    // Navigator.pushNamed(context, ForgotPasswordPage.routeName);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_reset,
                        color: Colors.blue,
                      ),
                      Text(
                        'نسيت كلمة المرور',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    ],
                  )),
            ],
          ),
          FormError(errors: errors),
          const SizedBox(height: defaultPadding),

          Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 90),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade400),
              child: MaterialButton(
                onPressed: () async {
                  loginUser();
                  // setState(() {showSpinner = true;});

                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    // final user = await _auth.signInWithPhoneNumber(phone);
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
                    }
                  } catch (e) {
                    print(e);
                  }

                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    KeyboardUtil.hideKeyboard(context);
                  }
                },
                child: Text(
                  "دخول",
                ),
                textColor: Colors.white,
              )),

          const SizedBox(
            height: defaultPadding,
          ),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Singup();
                }),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
              onPressed: () {
                FirebaseAuthMethods(FirebaseAuth.instance)
                    .signInWithFacebook(context);

                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  KeyboardUtil.hideKeyboard(context);
                }
              },
              icon: Image.asset(iFacebook),
              iconSize: 40,
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                // FirebaseAuthMethods(FirebaseAuth.instance)
                //     .signInWithGoogle(context);

                try {
                  final user = FirebaseAuthMethods(FirebaseAuth.instance)
                      .signInWithGoogle(context);

                  if (user != null) {
                    Navigator.pushNamed(context, Home.routeName);
                  }
                } catch (e) {
                  print(e);
                }

                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  KeyboardUtil.hideKeyboard(context);
                }
              },
              icon: Image.asset(iGoogle),
              iconSize: 35,
            ),
          ]),
          SizedBox(
            height: 15,
          ),
          // NoAccountText(),
        ],
      ),
    );
  }
}
