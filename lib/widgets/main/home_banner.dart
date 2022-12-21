import 'package:adam_family/constants/images_constant.dart';
import 'package:flutter/material.dart';
import 'package:adam_family/constants.dart';
import 'package:adam_family/responsive.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 1 : 1.7,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            iCover,
            fit: BoxFit.cover,
          ),
          Container(
            color: kDarkColor.withOpacity(0.1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مرحبًا بك واحدًا فى \n      عائلة آل آدم',
                  style: Responsive.isDesktop(context)
                      ? Theme.of(context).textTheme.headline3!.copyWith(
                          color: Color.fromARGB(255, 21, 41, 255),
                          fontWeight: FontWeight.bold)
                      : Theme.of(context).textTheme.headline5!.copyWith(
                          color: Color.fromARGB(255, 21, 41, 255),
                          fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 2,
                              vertical: kDefaultPadding),
                          backgroundColor: Color.fromARGB(151, 79, 136, 183),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'عرض الشجرة',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Image(
                              image: AssetImage(iTreeIcon),
                              width: 40,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
