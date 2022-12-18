import 'package:cart_admin/provider/dashboard_provider.dart';
import 'package:cart_admin/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerItems extends StatelessWidget {
  final int? id;
  final IconData leading;
  final String title;
  final Color? color;
  final bool isExpanded;
  final Function(int?)? onTap;

  const DrawerItems({Key? key, this.onTap, this.id, this.isExpanded = true, required this.leading, required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (_, ref, child) {
        return Tooltip(
          message: isExpanded ? "" : title ?? "",
          preferBelow: false,
          margin: const EdgeInsets.only(left: 80),
          decoration: BoxDecoration(
            color: MyTheme.drawerSelectedBackColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: MyTheme.drawerBackgroundColor,
              child: InkWell(
                onTap: () {
                  ref.setActiveDrawer(id ?? 0);
                  if (onTap != null) onTap!(id);
                },
                onHover: (b) {
                  ref.setActiveHoverDrawer(b ? id! : 0);
                },
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
          ),
        );
      },
    );
  }
}
