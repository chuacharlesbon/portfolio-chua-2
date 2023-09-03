import 'package:developerportfolio/constants/my_models.dart';

class MyAppBarMenu {
  static List<AppBarTiles> appBarMenu = [
    AppBarTiles(
      title: 'Home',
      routeName: 'home',
    ),
    AppBarTiles(
      title: 'Works',
      routeName: 'works',
    ),
    AppBarTiles(
      title: 'Contact',
      routeName: 'contact',
    ),
    AppBarTiles(
      title: 'About',
      routeName: 'about',
    ),
    AppBarTiles(
      title: 'Explore',
      routeName: 'explore',
    ),
  ];
}