import 'package:adam_family/constants.dart';
import 'package:adam_family/constants/images_constant.dart';
import 'package:flutter/material.dart';

class logo extends StatelessWidget {
  const logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.05,
      child: Container(
        color: kSecondaryColor2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Image(
              image: AssetImage(iTree),
              width: 140,
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              'ADAM’s FAMILY TREE ® \n       شجرة عائلة آل آدم',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'عائلة آل آدم \n إحدى أنسال عائلة آل قايد العريقة',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
