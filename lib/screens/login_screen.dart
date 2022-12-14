import 'package:cart_admin/components/custom_background.dart';
import 'package:cart_admin/provider/login_provider.dart';
import 'package:cart_admin/utils/my_routes.dart';
import 'package:cart_admin/utils/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../components/common_button.dart';
import '../components/custom_text_button.dart';
import '../components/splash_custom_cliper.dart';
import '../utils/my_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? check = false;
  bool? obscure = false;
  late LoginProvider loginProvider;
  @override
  void initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(MyRoutes.dashboard);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        mobile: CustomBackground(
          asset: "assets/png/login_portrait_background.jpg",
          fit: BoxFit.fitHeight,
          child: mobileWidget,
        ),
        tablet: desktopWidget,
        web: desktopWidget,
      ),
    );
  }

  Widget get desktopWidget => CustomBackground(
        fit: BoxFit.fill,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: mobileWidget,
            ),
          ],
        ),
      );

  Widget get mobileWidget => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Signin",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 29,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Welcome back",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormFieldComponent(
                    title: "Your Email",
                    hint: "email@address.com",
                    controller: emailController,
                  ),
                  Consumer<LoginProvider>(
                    builder: (_, ref, child) => TextFormFieldComponent(
                      isObscure: ref.isObscure,
                      title: "Password",
                      controller: passwordController,
                      hint: "6+ characters required",
                      suffixWidget: InkWell(
                        splashColor: Colors.white,
                        hoverColor: Colors.white,
                        onTap: () {
                          ref.toggleObscure();
                        },
                        child: Icon(
                          !ref.isObscure ? Icons.visibility_off : Icons.visibility,
                          color: MyTheme.textFormBorder,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<LoginProvider>(
                    builder: (_, ref, child) => CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      value: ref.isChecked,
                      checkColor: Colors.white,
                      activeColor: MyTheme.textFormBorder,
                      title: const Text("Remember me"),
                      controlAffinity: ListTileControlAffinity.leading,
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      onChanged: (checked) {
                        ref.toggleChecked(checked ?? false);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<LoginProvider>(
                    builder: (_, ref, child) => CommonButton(
                      text: ref.isLoading ? "Loading..." : "Login",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      onPressed: ref.isLoading
                          ? null
                          : () async {
                              bool b = await ref.login(emailController.text, passwordController.text);
                              if (b && mounted) {
                                context.go(MyRoutes.dashboard);
                              } else {
                                print("Invalid input");
                              }
                            },
                      borderRadius: 8,
                      verticalPadding: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
