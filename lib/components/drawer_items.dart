import 'package:cart_admin/utils/my_theme.dart';
import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  final int? id;
  final IconData leading;
  final String title;
  final Color? color;
  final bool isExpanded;
  final Function()? onTap;

  const DrawerItems({Key? key, this.onTap, this.id, this.isExpanded = true, required this.leading, required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: MyTheme.drawerBackgroundColor,
        child: InkWell(
          onTap: () => onTap!(),
          child: isExpanded
              ? Row(
                  children: [
                    Icon(
                      leading,
                      color: color ?? MyTheme.white,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 15, color: color ?? MyTheme.white),
                      ),
                    ),
                  ],
                )
              : Icon(
                  leading,
                  color: color ?? MyTheme.white,
                  size: 22,
                ),
        ),
      ),
    );
  }
}
