import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:developerportfolio/constants/my_themes.dart';
import 'package:developerportfolio/constants/my_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
    this.title,
    required this.size,
  }) : super(key: key);
  final String? title;
  final Size size;

  @override
  State<MyDrawer> createState() =>
      _MyDrawerScreenState();
}

class _MyDrawerScreenState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: ContainerTheme.bottomBorder(color: Colors.black.withOpacity(0.1)),
            ),
            height: 48,
            child: Padding(
              padding: ContainerTheme.padding8,
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/cmt_logo.jpg'
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close
                    ),
                  ),
                ]
              )
            ),
          ),
          ...getMenuItems(
            size: widget.size
          ),
          const Expanded(child: SizedBox()),
        ]
      )
    );
  }

  IconData getIcons(String title) {
    switch (title) {
      case 'Home': {
        return Icons.home;
      }
      case 'Works': {
        return Icons.apartment;
      }
      case 'Contact': {
        return Icons.phone;
      }
      case 'About': {
        return Icons.person;
      }
      case 'Explore': {
        return Icons.public;
      }
      default: {
        return Icons.home;
      }
    }
  }

  List<Widget> getMenuItems({required Size size}) {
    return MyAppBarMenu.appBarMenu.map(
        (item) {
          bool isHovered = false;
          return StatefulBuilder(
          builder: (context, setState) {
            return InkWell(
              focusColor: Colors.white70,
              onHover: (value) {
                print('this is the focus $value');
                setState(() {
                  isHovered = value;
                });
              },
              onTap: (){
                GetIt.instance<GoRouter>().goNamed(item.routeName ?? 'home');
              },
              child: Container(
                padding: ContainerTheme.paddingVHRegular,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(isHovered)
                    Icon(
                      getIcons(item.title ?? 'Home'),
                      color: Colors.blue,
                      size: 16,
                    ).animate().fadeIn(delay: 100.ms),
                    if(isHovered)
                    HorizontalSpacers.small,
                    Center(
                      child: Text(
                        item.title ?? '',
                        style: MyThemes.textTheme16()
                      ),
                    )
                  ]
                )
              )
            );
          }
        );}
      ).toList();
  }
}
