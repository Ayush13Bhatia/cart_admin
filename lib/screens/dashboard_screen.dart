import 'package:cart_admin/components/drawer_widget.dart';
import 'package:cart_admin/provider/dashboard_provider.dart';
import 'package:cart_admin/utils/my_routes.dart';
import 'package:cart_admin/utils/my_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../components/profile_menu_widget.dart';
import '../provider/login_provider.dart';
import '../utils/responsive_builder.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    // if (FirebaseAuth.instance.currentUser == null) {
    //   context.replaceNamed(MyRoutes.login);
    // }
    bool b = LoginProvider().getLoggedInUser();
    if (!b) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.go(MyRoutes.login);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<DashboardProvider>(
      builder: (_, ref, child) {
        return Scaffold(
          primary: true,
          drawer: const Drawer(
            child: DrawerWidget(),
          ),
          body: ResponsiveBuilder(
            mobile: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                title: const Text("Dashboard"),
              ),
              drawer: SizedBox(
                width: size.width * 0.6,
                child: const Drawer(
                  child: DrawerWidget(
                    isExpanded: true,
                  ),
                ),
              ),
              body: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("LogOut"),
                ),
              ),
            ),
            tablet: Center(
              child: ElevatedButton(
                onPressed: () async {
                  // await LoginProvider().logout();
                  // if (mounted) {
                  context.go(MyRoutes.login);
                  // }
                },
                child: const Text("LogOut"),
              ),
            ),
            web: webDashboard(ref.drawerExpanded, ref),
          ),
        );
      },
    );
  }

  Widget webDashboard(bool expanded, DashboardProvider ref) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/png/logo.png",
                height: 50,
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.toggleExpansion();
              },
              child: Icon(
                ref.drawerExpanded ? Icons.menu : Icons.close_rounded,
                color: MyTheme.black,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            ProfileMenuWidget(),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              DrawerWidget(
                isExpanded: expanded,
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
