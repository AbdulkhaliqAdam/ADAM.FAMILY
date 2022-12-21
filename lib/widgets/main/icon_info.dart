import 'package:adam_family/constants/images_constant.dart';
import 'package:adam_family/screens/pages/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adam_family/constants.dart';
import 'package:adam_family/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class IconInfo extends StatelessWidget {
  const IconInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri albumPhotos = Uri.parse(
        'https://drive.google.com/drive/folders/0B03h4yLPx50Xfm9ZYXlsTUl0RW5hLXdUYTJQLWpLTXhOWU1nNmhlYUd2cWdjMVJxX2JfeHM?resourcekey=0-U2F_RTSzhoZqsjQ3dmpjVg');

    final Uri book = Uri.parse(
        'https://drive.google.com/file/d/14OQHyNQrUNUzFE_JjGKKSpjyFpgLf2hP/view?usp=sharing');

    final _auth = FirebaseAuth.instance;

    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Responsive.isMobileLarge(context)
          ? Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding,
                                vertical: kDefaultPadding),
                            backgroundColor: Color.fromARGB(29, 50, 146, 224),
                          ),
                          onPressed: () {
                            launchUrl(book);
                          },
                          child: Column(
                            children: [
                              Text(
                                ' عرض الكتاب',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image(
                                image: AssetImage(iBook),
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding,
                                vertical: kDefaultPadding),
                            backgroundColor: Color.fromARGB(29, 50, 146, 224),
                          ),
                          onPressed: () {
                            launchUrl(albumPhotos);
                          },
                          child: Column(
                            children: [
                              Text(
                                'ألبوم الصور',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image(
                                image: AssetImage(iPhotos),
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: kDefaultPadding * 3,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: kDefaultPadding),
                          backgroundColor: Color.fromARGB(29, 50, 146, 224),
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, ChatScreen.routeName);
                          // FirebaseAuth.instance.chatScreen()
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen()));
                        },
                        child: Column(
                          children: [
                            Text(
                              'Chat-دردشة',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              image: AssetImage(iChat),
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: BuildIconInfo(
                          context: context,
                          icon: SvgPicture.asset(iTreeIcon),
                          text: 'مجتمع',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: kDefaultPadding),
                  backgroundColor: Color.fromARGB(29, 50, 146, 224),
                ),
                onPressed: () {
                  launchUrl(book);
                },
                child: Column(
                  children: [
                    Text(
                      ' عرض الكتاب',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage(iBook),
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: kDefaultPadding),
                  backgroundColor: Color.fromARGB(29, 50, 146, 224),
                ),
                onPressed: () {
                  launchUrl(albumPhotos);
                },
                child: Column(
                  children: [
                    Text(
                      'ألبوم الصور',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage(iPhotos),
                      width: 50,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: kDefaultPadding),
                  backgroundColor: Color.fromARGB(29, 50, 146, 224),
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, ChatScreen.routeName);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatScreen()));
                },
                child: Column(
                  children: [
                    Text(
                      'Chat-دردشة',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage(iChat),
                      width: 50,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: BuildIconInfo(
                  context: context,
                  icon: SvgPicture.asset(iTreeIcon),
                  text: 'مجتمع',
                ),
              ),
            ]),
    );
  }

  Column BuildIconInfo({
    required BuildContext context,
    required SvgPicture icon,
    required String text,
  }) {
    return Column(children: [
      SvgPicture.asset(
        '',
      ),
      Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: kPrimaryColor2, fontSize: 30),
      ),
    ]);
  }
}
