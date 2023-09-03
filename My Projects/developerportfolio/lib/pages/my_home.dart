import 'package:developerportfolio/components/my_appbar.dart';
import 'package:developerportfolio/components/my_drawer.dart';
import 'package:developerportfolio/helpers/change_favicon.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({
    super.key,
    this.data});
  final dynamic data;

  @override
  State<MyHomeScreen> createState() =>
      _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  @override
  void initState() {
    changeFavicon('favicon2.jpg');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(size: size),
      drawer: null, //MyDrawer(size: size),
      endDrawer: MyDrawer(size: size),
      body: const Text('Home'),
      bottomNavigationBar: null,
    );
  }
}
