import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final String? asset;
  final Widget child;
  final BoxFit? fit;
  const CustomBackground({Key? key, this.asset, required this.child, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          asset ?? "assets/png/login_landscape_background.jpg",
          fit: fit ?? BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
