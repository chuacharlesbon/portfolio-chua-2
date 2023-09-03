import 'package:developerportfolio/components/my_appbar.dart';
import 'package:developerportfolio/components/my_carousel.dart';
import 'package:developerportfolio/components/my_drawer.dart';
import 'package:developerportfolio/constants/my_themes.dart';
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
      body: const MyHomeSection(),
      bottomNavigationBar: null,
    );
  }
}

class MyHomeSection extends StatefulWidget {
  const MyHomeSection({
    super.key,
    this.data});
  final dynamic data;

  @override
  State<MyHomeSection> createState() =>
      _MyHomeSectionState();
}

class _MyHomeSectionState extends State<MyHomeSection> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> myCarousel = ['https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096'];
    return SingleChildScrollView(
      child: Column(
        children: [
          VerticalSpacers.fromSize(24),
          AspectRatio(
            aspectRatio: 5 / 1,
            child: MyCarousel(
              items: myCarousel,
            ),
          ),
          VerticalSpacers.fromSize(24),
          Row(
            children: [
              if(size.width > 1920)
              Container(
                color: Colors.black.withOpacity(0.05),
                width: 240,
                height: size.height,
                child: ListView(
                  children: [
                    Text('News')
                  ],
                )
              ),
              Expanded(
                child: SizedBox(
                  height: size.height,
                  child: const Center(child: Text('Home'))
                )
              ),
              if(size.width > 1920)
              Container(
                color: Colors.black.withOpacity(0.05),
                width: 240,
                height: size.height,
                child: ListView(
                  children: [
                    Text('News')
                  ],
                )
              ),
            ],
          )
        ],
      )
    );
  }
}
