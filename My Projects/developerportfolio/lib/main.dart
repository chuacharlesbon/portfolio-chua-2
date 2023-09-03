import 'package:developerportfolio/components/app_title_builder.dart';
import 'package:developerportfolio/pages/my_home.dart';
import 'package:developerportfolio/pages/my_works.dart';
import 'package:developerportfolio/routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void main() {
  final serviceLocator = GetIt.instance;
  serviceLocator.registerLazySingleton<GoRouter>(
    () => GoRouter(
      initialLocation: '/',
      routes: MyRoutes.myRoutes,
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Developer's Portfolio",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final serviceLocator = GetIt.instance;
    return MaterialApp.router(
      title: "Developer's Portfolio | Charles Chua",
      routerConfig: serviceLocator<GoRouter>(), //_router,
    );
  }
}
