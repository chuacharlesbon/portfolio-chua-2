import 'package:developerportfolio/components/app_title_builder.dart';
import 'package:developerportfolio/pages/my_home.dart';
import 'package:developerportfolio/pages/my_works.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRoutes {
  static List<RouteBase> myRoutes = [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => const MaterialPage(
        child: AppTitleBuilder(
            title: "Developer's Portfolio | Home", child: MyHomeScreen()),
      ),
    ),
    GoRoute(
      path: '/works',
      name: 'works',
      pageBuilder: (context, state) => const MaterialPage(
        child: AppTitleBuilder(
            title: "Developer's Portfolio | Works", child: MyWorksScreen()),
      ),
    )
  ];
}
