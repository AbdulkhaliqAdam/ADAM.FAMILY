import 'package:flutter/material.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    Key? key,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;
  final TextAlign? textAlign;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blueAccent,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 60.0),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    textAlign: textAlign,
                    style: Theme.of(context).textTheme.headline6),
                Text(subTitle,
                    textAlign: textAlign,
                    style: Theme.of(context).textTheme.bodyText2),
              ],
            )
          ],
        ),
      ),
    );
  }
}
