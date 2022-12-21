import 'package:adam_family/constants.dart';
import 'package:adam_family/screens/pages/profile/profile_controller.dart';
import 'package:adam_family/screens/pages/profile/profile_menu.dart';
import 'package:adam_family/screens/pages/profile/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          tEditProfile,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child:
              // FutureBuilder(
              // future: controller.getUserData(),

              FutureBuilder<List<UserModel>>(
            future: controller.getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  // UserModel userData = snapshot.data as UserModel;
                  return

                      //
                      ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (c, index) {
                      return Column(
                        children: [
                          ListTile(
                            iconColor: Colors.blue,
                            leading: const Icon(LineAwesomeIcons.user_1),
                            tileColor: Colors.blue.withOpacity(0.1),
                            title: Text(
                                "الاسم: ${snapshot.data![index].fullName}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].phoneNo),
                                Text(snapshot.data![index].email),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );

                  // Column(
                  //   ///Step 4 - Warp this Widget with FutureBuilder
                  //   children: [
                  //     Stack(
                  //       children: [
                  //         SizedBox(
                  //           width: 120,
                  //           height: 120,
                  //           child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(100),
                  //               child: Image(image: AssetImage(''))),
                  //         ),
                  //         Positioned(
                  //           bottom: 0,
                  //           right: 0,
                  //           child: Container(
                  //             width: 35,
                  //             height: 35,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(100),
                  //               color: Colors.grey.withOpacity(0.1),
                  //             ),
                  //             child: Icon(
                  //               LineAwesomeIcons.camera,
                  //               size: 20,
                  //               color: Colors.black,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     const SizedBox(height: 50,),
                  //     // -- Form Field
                  //     Form(
                  //         child: Column(
                  //       children: [
                  //         TextFormField(
                  //           initialValue: userData.fullName,
                  //           textInputAction: TextInputAction.next,
                  //           cursorColor: kPrimaryColor,
                  //           decoration: const InputDecoration(
                  //             filled: true,
                  //             fillColor: null,
                  //             labelText: " الاسم بالكامل",
                  //             contentPadding: EdgeInsets.symmetric(
                  //               vertical: 10,
                  //               horizontal: 20,
                  //             ),
                  //             border: OutlineInputBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             enabledBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                 color: Colors.red,
                  //                 width: 1,
                  //               ),
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(20),
                  //               ),
                  //             ),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderSide:
                  //                     BorderSide(color: Colors.blue, width: 2),
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             prefixIcon: Padding(
                  //               padding: const EdgeInsets.all(15),
                  //               child: Icon(
                  //                 Icons.person,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(height: defaultPadding / 1.5),
                  //         TextFormField(
                  //           initialValue: userData.email,
                  //           keyboardType: TextInputType.emailAddress,
                  //           textInputAction: TextInputAction.next,
                  //           cursorColor: kPrimaryColor,
                  //           decoration: const InputDecoration(
                  //             filled: true,
                  //             fillColor: null,
                  //             labelText: "البريد الألكترونى ",
                  //             contentPadding: EdgeInsets.symmetric(
                  //               vertical: 10,
                  //               horizontal: 20,
                  //             ),
                  //             border: OutlineInputBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             enabledBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                 color: Colors.red,
                  //                 width: 1,
                  //               ),
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(20),
                  //               ),
                  //             ),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderSide:
                  //                     BorderSide(color: Colors.blue, width: 2),
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //             prefixIcon: Padding(
                  //               padding: const EdgeInsets.all(8),
                  //               child: Icon(Icons.email_rounded),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(height: defaultPadding / 1.5),
                  //         Row(
                  //           children: [
                  //             // Expanded(
                  //             //   flex: 3,
                  //             //   child: SizedBox(
                  //             //     width: 200,
                  //             //     child: DropdownButtonFormField<String>(
                  //             //         decoration: InputDecoration(
                  //             //           filled: true,
                  //             //           fillColor: null,
                  //             //           contentPadding: EdgeInsets.symmetric(
                  //             //             vertical: 10,
                  //             //             horizontal: 20,
                  //             //           ),
                  //             //           border: OutlineInputBorder(
                  //             //               borderRadius:
                  //             //                   BorderRadius.all(Radius.circular(20))),
                  //             //           enabledBorder: OutlineInputBorder(
                  //             //             borderSide: BorderSide(
                  //             //               color: Colors.red,
                  //             //               width: 1,
                  //             //             ),
                  //             //             borderRadius: BorderRadius.all(
                  //             //               Radius.circular(20),
                  //             //             ),
                  //             //           ),
                  //             //           focusedBorder: OutlineInputBorder(
                  //             //               borderSide:
                  //             //                   BorderSide(color: Colors.blue, width: 2),
                  //             //               borderRadius:
                  //             //                   BorderRadius.all(Radius.circular(20))),
                  //             //           floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //             //         ),
                  //             //         value: selectedItem,
                  //             //         items: itemsList
                  //             //             .map((item) => DropdownMenuItem(
                  //             //                   value: item,
                  //             //                   child: Text(item),
                  //             //                 ))
                  //             //             .toList(),
                  //             //         onChanged: (item) =>
                  //             //             setState(() => selectedItem = item)),
                  //             //   ),
                  //             // ),
                  //             Expanded(
                  //               flex: 8,
                  //               child: TextFormField(
                  //                 initialValue: userData.phoneNo,
                  //                 keyboardType: TextInputType.phone,
                  //                 textInputAction: TextInputAction.next,
                  //                 cursorColor: kPrimaryColor,
                  //                 decoration: const InputDecoration(
                  //                   filled: true,
                  //                   fillColor: null,
                  //                   labelText: "رقم الهاتف",
                  //                   contentPadding: EdgeInsets.symmetric(
                  //                     vertical: 10,
                  //                     horizontal: 20,
                  //                   ),
                  //                   border: OutlineInputBorder(
                  //                       borderRadius: BorderRadius.all(
                  //                           Radius.circular(20))),
                  //                   enabledBorder: OutlineInputBorder(
                  //                     borderSide: BorderSide(
                  //                       color: Colors.red,
                  //                       width: 1,
                  //                     ),
                  //                     borderRadius: BorderRadius.all(
                  //                       Radius.circular(20),
                  //                     ),
                  //                   ),
                  //                   focusedBorder: OutlineInputBorder(
                  //                       borderSide: BorderSide(
                  //                           color: Colors.blue, width: 2),
                  //                       borderRadius: BorderRadius.all(
                  //                           Radius.circular(20))),
                  //                   floatingLabelBehavior:
                  //                       FloatingLabelBehavior.auto,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         SizedBox(height: defaultPadding / 1.5),
                  //         TextFormField(
                  //           initialValue: userData.password,
                  //           textInputAction: TextInputAction.done,
                  //           cursorColor: kPrimaryColor,
                  //           decoration: const InputDecoration(
                  //             filled: true,
                  //             fillColor: null,
                  //             labelText: " كلمة المرور",
                  //             contentPadding: EdgeInsets.symmetric(
                  //               vertical: 10,
                  //               horizontal: 20,
                  //             ),
                  //             border: OutlineInputBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             enabledBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                 color: Colors.red,
                  //                 width: 1,
                  //               ),
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(20),
                  //               ),
                  //             ),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderSide:
                  //                     BorderSide(color: Colors.blue, width: 2),
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             prefixIcon: Padding(
                  //               padding: const EdgeInsets.all(8),
                  //               child: Icon(Icons.lock),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(height: tFormHeight),
                  //         SizedBox(
                  //           width: double.infinity,
                  //           child: ElevatedButton(
                  //             onPressed: () =>
                  //                 Get.to(() => const UpdateProfileScreen()),
                  //             style: ElevatedButton.styleFrom(
                  //                 backgroundColor: tPrimaryColor,
                  //                 side: BorderSide.none,
                  //                 shape: const StadiumBorder()),
                  //             child: const Text(tEditProfile,
                  //                 style: TextStyle(color: tDarkColor)),
                  //           ),
                  //         ),
                  //         SizedBox(height: tFormHeight),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             const Text.rich(TextSpan(
                  //                 text: tJoined,
                  //                 style: TextStyle(fontSize: 12),
                  //                 children: [
                  //                   TextSpan(
                  //                       text: tJoinedAt,
                  //                       style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           fontSize: 12))
                  //                 ])),
                  //             ElevatedButton(
                  //               onPressed: () {},
                  //               style: ElevatedButton.styleFrom(
                  //                 backgroundColor:
                  //                     Colors.redAccent.withOpacity(0.1),
                  //                 elevation: 0,
                  //                 foregroundColor: Colors.red,
                  //                 shape: const StadiumBorder(),
                  //                 side: BorderSide.none,
                  //               ),
                  //               child: const Text(tDelete),
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ))
                  //   ],
                  // );

                  //
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('هناك خطأ'));
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}




// ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (c, index) {
//                       return Column(
//                         children: [
//                           ListTile(
//                             iconColor: Colors.blue,
//                             leading: const Icon(LineAwesomeIcons.user_1),
//                             tileColor: Colors.blue.withOpacity(0.1),
//                             title: Text(
//                                 "الاسم: ${snapshot.data![index].fullName}"),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(snapshot.data![index].phoneNo),
//                                 Text(snapshot.data![index].email),
//                               ],
//                             ),
//                           )
//                         ],
//                       );
//                     },
//                   );



                  // Column(
                  //   ///Step 4 - Warp this Widget with FutureBuilder
                  //   children: [
                  //     Stack(
                  //       children: [
                  //         SizedBox(
                  //           width: 120,
                  //           height: 120,
                  //           child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(100),
                  //               child: Image(image: AssetImage(''))),
                  //         ),
                  //         Positioned(
                  //           bottom: 0,
                  //           right: 0,
                  //           child: Container(
                  //             width: 35,
                  //             height: 35,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(100),
                  //               color: Colors.grey.withOpacity(0.1),
                  //             ),
                  //             child: Icon(
                  //               LineAwesomeIcons.camera,
                  //               size: 20,
                  //               color: Colors.black,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     const SizedBox( height: 50,),
                  //     Form(
                  //         child: Column(
                  //       children: [
                  //         TextFormField(
                  //           initialValue: userData.fullName,
                  //           textInputAction: TextInputAction.next,
                  //           cursorColor: kPrimaryColor,
                  //           decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: null,
                  //             labelText: " الاسم بالكامل",
                  //             contentPadding: EdgeInsets.symmetric(
                  //               vertical: 10,
                  //               horizontal: 20,
                  //             ),
                  //             border: OutlineInputBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             enabledBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                 color: Colors.red,
                  //                 width: 1,
                  //               ),
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(20),
                  //               ),
                  //             ),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderSide:
                  //                     BorderSide(color: Colors.blue, width: 2),
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             prefixIcon: Padding(
                  //               padding: const EdgeInsets.all(15),
                  //               child: Icon(
                  //                 Icons.person,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(height: defaultPadding / 1.5),
                  //         TextFormField(
                  //           initialValue: userData.fullName,
                  //           keyboardType: TextInputType.emailAddress,
                  //           textInputAction: TextInputAction.next,
                  //           cursorColor: kPrimaryColor,
                  //           decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: null,
                  //             labelText: "البريد الألكترونى ",
                  //             contentPadding: EdgeInsets.symmetric(
                  //               vertical: 10,
                  //               horizontal: 20,
                  //             ),
                  //             border: OutlineInputBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             enabledBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                 color: Colors.red,
                  //                 width: 1,
                  //               ),
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(20),
                  //               ),
                  //             ),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderSide:
                  //                     BorderSide(color: Colors.blue, width: 2),
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //             prefixIcon: Padding(
                  //               padding: const EdgeInsets.all(8),
                  //               child: Icon(Icons.email_rounded),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(height: defaultPadding / 1.5),
                  //         Row(
                  //           children: [
                  //             // Expanded(
                  //             //   flex: 3,
                  //             //   child: SizedBox(
                  //             //     width: 200,
                  //             //     child: DropdownButtonFormField<String>(
                  //             //         decoration: InputDecoration(
                  //             //           filled: true,
                  //             //           fillColor: null,
                  //             //           contentPadding: EdgeInsets.symmetric(
                  //             //             vertical: 10,
                  //             //             horizontal: 20,
                  //             //           ),
                  //             //           border: OutlineInputBorder(
                  //             //               borderRadius:
                  //             //                   BorderRadius.all(Radius.circular(20))),
                  //             //           enabledBorder: OutlineInputBorder(
                  //             //             borderSide: BorderSide(
                  //             //               color: Colors.red,
                  //             //               width: 1,
                  //             //             ),
                  //             //             borderRadius: BorderRadius.all(
                  //             //               Radius.circular(20),
                  //             //             ),
                  //             //           ),
                  //             //           focusedBorder: OutlineInputBorder(
                  //             //               borderSide:
                  //             //                   BorderSide(color: Colors.blue, width: 2),
                  //             //               borderRadius:
                  //             //                   BorderRadius.all(Radius.circular(20))),
                  //             //           floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //             //         ),
                  //             //         value: selectedItem,
                  //             //         items: itemsList
                  //             //             .map((item) => DropdownMenuItem(
                  //             //                   value: item,
                  //             //                   child: Text(item),
                  //             //                 ))
                  //             //             .toList(),
                  //             //         onChanged: (item) =>
                  //             //             setState(() => selectedItem = item)),
                  //             //   ),
                  //             // ),
                  //             Expanded(
                  //               flex: 8,
                  //               child: TextFormField(
                  //                 keyboardType: TextInputType.phone,
                  //                 textInputAction: TextInputAction.next,
                  //                 cursorColor: kPrimaryColor,
                  //                 decoration: InputDecoration(
                  //                   filled: true,
                  //                   fillColor: null,
                  //                   labelText: "رقم الهاتف",
                  //                   contentPadding: EdgeInsets.symmetric(
                  //                     vertical: 10,
                  //                     horizontal: 20,
                  //                   ),
                  //                   border: OutlineInputBorder(
                  //                       borderRadius: BorderRadius.all(
                  //                           Radius.circular(20))),
                  //                   enabledBorder: OutlineInputBorder(
                  //                     borderSide: BorderSide(
                  //                       color: Colors.red,
                  //                       width: 1,
                  //                     ),
                  //                     borderRadius: BorderRadius.all(
                  //                       Radius.circular(20),
                  //                     ),
                  //                   ),
                  //                   focusedBorder: OutlineInputBorder(
                  //                       borderSide: BorderSide(
                  //                           color: Colors.blue, width: 2),
                  //                       borderRadius: BorderRadius.all(
                  //                           Radius.circular(20))),
                  //                   floatingLabelBehavior:
                  //                       FloatingLabelBehavior.auto,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         SizedBox(height: defaultPadding / 1.5),
                  //         TextFormField(
                  //           textInputAction: TextInputAction.done,
                  //           cursorColor: kPrimaryColor,
                  //           decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: null,
                  //             labelText: " كلمة المرور",
                  //             contentPadding: EdgeInsets.symmetric(
                  //               vertical: 10,
                  //               horizontal: 20,
                  //             ),
                  //             border: OutlineInputBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             enabledBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                 color: Colors.red,
                  //                 width: 1,
                  //               ),
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(20),
                  //               ),
                  //             ),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderSide:
                  //                     BorderSide(color: Colors.blue, width: 2),
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20))),
                  //             prefixIcon: Padding(
                  //               padding: const EdgeInsets.all(8),
                  //               child: Icon(Icons.lock),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(height: tFormHeight),
                  //         SizedBox(
                  //           width: double.infinity,
                  //           child: ElevatedButton(
                  //             onPressed: () =>
                  //                 Get.to(() => const UpdateProfileScreen()),
                  //             style: ElevatedButton.styleFrom(
                  //                 backgroundColor: tPrimaryColor,
                  //                 side: BorderSide.none,
                  //                 shape: const StadiumBorder()),
                  //             child: const Text(tEditProfile,
                  //                 style: TextStyle(color: tDarkColor)),
                  //           ),
                  //         ),
                  //         SizedBox(height: tFormHeight),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             const Text.rich(TextSpan(
                  //                 text: tJoined,
                  //                 style: TextStyle(fontSize: 12),
                  //                 children: [
                  //                   TextSpan(
                  //                       text: tJoinedAt,
                  //                       style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           fontSize: 12))
                  //                 ])),
                  //             ElevatedButton(
                  //               onPressed: () {},
                  //               style: ElevatedButton.styleFrom(
                  //                 backgroundColor:
                  //                     Colors.redAccent.withOpacity(0.1),
                  //                 elevation: 0,
                  //                 foregroundColor: Colors.red,
                  //                 shape: const StadiumBorder(),
                  //                 side: BorderSide.none,
                  //               ),
                  //               child: const Text(tDelete),
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ))
                  //   ],
                  // );
