import 'package:adam_family/widgets/menu/side_menu_section.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:adam_family/responsive.dart';
import 'package:adam_family/constants.dart';

class FirstScreen extends StatefulWidget {
  static String routeName = "/first_screen";

  const FirstScreen({
    Key? key,
    required SingleChildScrollView this.mainSection,
  }) : super(key: key);

  final Widget mainSection;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _auth = FirebaseAuth.instance;
  late User signedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: kBgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
            ),
      drawer: SideMenuSection(),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1440.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: SideMenuSection(),
                ),
              SizedBox(
                width: kDefaultPadding / 5,
              ),
              Expanded(
                flex: 8,
                child: widget.mainSection,
              ),
              SizedBox(
                width: kDefaultPadding / 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
