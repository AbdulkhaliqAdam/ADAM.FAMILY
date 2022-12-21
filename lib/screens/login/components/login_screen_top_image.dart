import 'package:adam_family/constants/images_constant.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "مرحبًا بعودتك",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Color.fromARGB(196, 226, 10, 108),
          ),
        ),
        SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset(iTree),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
