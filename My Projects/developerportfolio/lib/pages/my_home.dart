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
      appBar: null,
      drawer: null,
      body: const Text('Home'),
      bottomNavigationBar: null,
    );
  }
}
