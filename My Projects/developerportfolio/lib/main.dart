import 'package:developerportfolio/components/app_title_builder.dart';
import 'package:developerportfolio/pages/my_home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void main() {
  final serviceLocator = GetIt.instance;
  serviceLocator.registerLazySingleton<GoRouter>(
    () => GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) => const MaterialPage(
            child: AppTitleBuilder(
              title: "Developer's Portfolio | Home",
              child: MyHomeScreen()
            ),
          ),
        ),
        GoRoute(
          path: '/works',
          name: 'works',
          pageBuilder: (context, state) => const MaterialPage(
            child: AppTitleBuilder(
              title: "Developer's Portfolio | Works",
              child: MyHomeScreen()
            ),
          ),
        )
      ],
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final serviceLocator = GetIt.instance;

    return MaterialApp.router(
      title: "Developer's Portfolio | Charles Chua",
      routerConfig: serviceLocator<GoRouter>(), //_router,
    );
  }

  final GoRouter _router = GoRouter(routes: [
    ShellRoute(
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: child,
      ),
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) => const MaterialPage(
            child: AppTitleBuilder(
              title: "Developer's Portfolio | Home",
              child: MyHomeScreen()
            ),
          ),
        )
      ]
    )
    ]
  );
}
