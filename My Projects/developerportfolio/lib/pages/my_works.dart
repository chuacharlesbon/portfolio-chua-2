import 'package:developerportfolio/components/my_appbar.dart';
import 'package:developerportfolio/components/my_drawer.dart';
import 'package:developerportfolio/helpers/change_favicon.dart';
import 'package:flutter/material.dart';

class MyWorksScreen extends StatefulWidget {
  const MyWorksScreen({
    super.key,
    this.data});
  final dynamic data;

  @override
  State<MyWorksScreen> createState() =>
      _MyWorksScreenState();
}

class _MyWorksScreenState extends State<MyWorksScreen> {

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
      body: const Text('Works'),
      bottomNavigationBar: null,
    );
  }
}
