import 'package:adam_family/screens/pages/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:adam_family/constants.dart';

class AddImageScreen extends StatelessWidget {
  const AddImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
                },
                child: FittedBox(
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: kDefaultPadding / 2,
                      ),
                      Text(
                        'الملف الشخصى',
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color),
                      )
                    ],
                  ),
                ))
          ],
        )
      ],
    );
  }
}
