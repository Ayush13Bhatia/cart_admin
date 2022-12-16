import 'package:cart_admin/components/drawer_items.dart';
import 'package:cart_admin/provider/dashboard_provider.dart';
import 'package:cart_admin/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer_heading_text.dart';

class DrawerWidget extends StatelessWidget {
  final bool? isExpanded;
  const DrawerWidget({Key? key, this.isExpanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<DashboardProvider>(
      builder: (_, ref, child) {
        return AnimatedContainer(
          width: (isExpanded ?? true) ? size.width * 0.2 : 80,
          duration: const Duration(
            milliseconds: 300,
          ),
          child: Container(
            color: MyTheme.drawerBackgroundColor,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                DrawerItems(
                  title: "Dashboard",
                  leading: Icons.home_outlined,
                  id: 1,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItems(
                  title: "POS",
                  leading: Icons.shopping_basket_outlined,
                  id: 2,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerHeadingText(
                  drawerTitle: "Order Management",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 5),
                DrawerItems(
                  title: "Orders",
                  leading: Icons.shopping_cart,
                  id: 3,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItems(
                  title: "Order Refunds",
                  leading: Icons.receipt_long,
                  id: 4,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItems(
                  title: "Dispatch",
                  leading: Icons.speed_sharp,
                  id: 5,
                  isExpanded: isExpanded ?? false,
                ),
                // PARCEL MANAGEMENT
                DrawerHeadingText(
                  drawerTitle: "PARCEL MANAGEMENT",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 5),
                DrawerItems(
                  title: "Parcel Category",
                  leading: Icons.category_outlined,
                  id: 6,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItems(
                  title: "Parcel Orders",
                  leading: Icons.delivery_dining_outlined,
                  id: 7,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItems(
                  title: "Parcel Settings",
                  leading: Icons.settings_applications_outlined,
                  id: 8,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerHeadingText(
                  drawerTitle: "ITEM MANAGEMENT",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 5),
                DrawerItems(
                  title: "Category / Subcategory",
                  leading: Icons.lan_outlined,
                  id: 9,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItems(
                  title: "Attributes",
                  leading: Icons.edit_attributes_outlined,
                  id: 10,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItems(
                  title: "Units",
                  leading: Icons.straighten_rounded,
                  id: 11,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItems(
                  title: "Items",
                  leading: Icons.inventory_2_outlined,
                  id: 12,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerHeadingText(
                  drawerTitle: "STORE MANAGEMENT",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 5),
                DrawerItems(
                  title: "Store Settings",
                  leading: Icons.store_mall_directory_outlined,
                  id: 13,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerHeadingText(
                  drawerTitle: " Delivery Man Management",
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 5),
                DrawerItems(
                  title: "Add Delivery Man",
                  leading: Icons.directions_run_outlined,
                  id: 14,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItems(
                  title: "Delivery Man List",
                  leading: Icons.filter_list,
                  id: 15,
                  isExpanded: isExpanded ?? false,
                ),
                DrawerItems(
                  title: "Reviews",
                  leading: Icons.star_border_outlined,
                  id: 16,
                  isExpanded: isExpanded ?? false,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
