import 'package:flutter/material.dart';

class AppTitleBuilder extends StatelessWidget {
  const AppTitleBuilder({
    Key? key,
    this.title,
    required this.child,
  }) : super(key: key);
  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    switch (title) {
      case ('Home'):
        return Title(
          color: Colors.black,
          title: "Developer's Portfolio | Charles Chua",
          child: child,
        );

      default:
        return Title(
          color: Colors.black,
          title: title ?? "Developer's Portfolio | Charles Chua",
          child: child,
        );
    }
  }
}
