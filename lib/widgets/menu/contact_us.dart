import 'package:adam_family/constants/images_constant.dart';
import 'package:flutter/material.dart';
import 'package:rename/rename.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri youtube =
        Uri.parse('https://www.youtube.com/channel/UC4vL2GHsB7bq5z41-m-NqJg');
    final Uri map = Uri.parse('https://goo.gl/maps/Vr81ngxNaL8u1mxr6');
    final Uri website = Uri.parse('https://youtube.com/@Adam.Family');

    final Uri phone = Uri.parse('tel:+2-0109-563-8471');
    final Uri whatsApp = Uri.parse('https://wa.me/201095638471');
    final Uri mail =
        Uri.parse('https://mail.google.com/mail/Adam.Family.Tree@gmail.com');
    final Uri facebook = Uri.parse('https://www.facebook.com/AbdulkhaliqAdam');

// //
//     void sendWhatsAppMessage() async {
//       String whatsAppNo = '+201095638471';
//       var url = 'https://wa.me/$whatsAppNo?text=مرحبًا بك ';
//       if (await canLaunch(url)) {
//         await launch(url);
//       } else {
//         print('خطأ');
//         throw 'هناك خطأ';
//       }
//     }
//     //

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(backgroundImage: AssetImage(iWeb)),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {
                launchUrl(map);
              },
              icon: CircleAvatar(backgroundImage: AssetImage(iLocation)),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {
                launchUrl(youtube);
              },
              icon: CircleAvatar(backgroundImage: AssetImage(iYoutube)),
              iconSize: 35,
            ),
            Spacer()
          ],
        ),
        Divider(),
        SizedBox(
          height: 100,
        ),
        Divider(),
        Text('تواصل معنا'),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Spacer(),
            IconButton(
              onPressed: () async {
                print(await canLaunchUrl(phone));
              },
              icon: CircleAvatar(backgroundImage: AssetImage(iPhone)),
              iconSize: 24,
            ),
            IconButton(
              onPressed: () async {
                await launchUrl(whatsApp);
                // sendWhatsAppMessage();
              },
              icon: CircleAvatar(backgroundImage: AssetImage(iWhatsApp)),
              iconSize: 24,
            ),
            IconButton(
              onPressed: () {
                launchUrl(mail);
              },
              icon: CircleAvatar(backgroundImage: AssetImage(iMail)),
              iconSize: 24,
            ),
            IconButton(
              onPressed: () {
                launchUrl(facebook);
              },
              icon: CircleAvatar(backgroundImage: AssetImage(iFacebook)),
              iconSize: 24,
            ),
            Spacer()
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
