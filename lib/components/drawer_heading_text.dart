import 'package:cart_admin/utils/my_theme.dart';
import 'package:flutter/material.dart';

class DrawerHeadingText extends StatelessWidget {
  final String? drawerTitle;
  final bool isExpanded;
  const DrawerHeadingText({Key? key, this.isExpanded = true, this.drawerTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? Padding(
            padding: EdgeInsets.only(left: isExpanded ? 10.0 : 20.0, top: 15),
            child: Text(
              (drawerTitle ?? "").toUpperCase(),
              style: const TextStyle(
                color: MyTheme.drawerSubHeadingColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ))
        : const Icon(
            Icons.more_horiz,
            color: MyTheme.drawerSubHeadingColor,
          );
  }
}
