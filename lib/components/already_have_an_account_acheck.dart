import 'package:adam_family/constants.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "تسجيل حساب" : "دخول",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          login ? "ليس لديك حساب ؟ " : "! لديك حساب بالفعل ",
          style: const TextStyle(color: kPrimaryColor),
        )
      ],
    );
  }
}
