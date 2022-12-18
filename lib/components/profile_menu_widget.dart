import 'package:cart_admin/utils/my_routes.dart';
import 'package:cart_admin/utils/my_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../provider/login_provider.dart';

class ProfileMenuWidget extends StatelessWidget {
  ProfileMenuWidget({Key? key}) : super(key: key);
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, top: 10.0, bottom: 10.0),
      child: SizedBox(
        child: GestureDetector(
          onTapDown: (details) {
            showMenu(
              context: context,
              elevation: 60,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              position: RelativeRect.fromLTRB(details.globalPosition.dx, 60, details.globalPosition.dx, details.globalPosition.dx),
              items: [
                PopupMenuItem(child: profileNameWidget(isMain: false)),
                getDividerWidget(),
                const PopupMenuItem(
                  child: Text('Settings'),
                ),
                getDividerWidget(),
                PopupMenuItem(
                  onTap: () async {
                    await LoginProvider().logout();
                    context.go(MyRoutes.login);
                  },
                  child: Text("Logout"),
                )
              ],
            );
          },
          child: profileNameWidget(),
        ),
      ),
    );
  }

  Widget profileNameWidget({bool isMain = true}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: isMain,
          child: const Icon(
            Icons.arrow_drop_down,
            color: MyTheme.drawerBackgroundColor,
          ),
        ),
        Visibility(visible: !isMain, child: profileCircleWidget()),
        const Visibility(
          child: SizedBox(
            width: 10,
          ),
        ),
        Column(
          crossAxisAlignment: !isMain ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              "John ${isMain ? "Doe" : ""}",
              style: const TextStyle(fontWeight: FontWeight.bold, color: MyTheme.drawerBackgroundColor),
            ),
            Text(user?.email ?? ""),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Visibility(visible: isMain, child: profileCircleWidget()),
      ],
    );
  }

  Widget profileCircleWidget() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: MyTheme.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image.asset('assets/png/user_image.png'),
          ),
        ),
        Positioned(
          right: 2,
          bottom: 3,
          child: Container(
            decoration: BoxDecoration(
              color: MyTheme.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  PopupMenuItem getDividerWidget() {
    return const PopupMenuItem(
      enabled: false,
      padding: EdgeInsets.zero,
      height: 10,
      child: Divider(),
    );
  }
}
