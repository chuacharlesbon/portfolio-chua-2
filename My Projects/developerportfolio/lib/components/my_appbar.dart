import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:developerportfolio/constants/my_themes.dart';
import 'package:developerportfolio/constants/my_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    this.title,
    required this.size,
  }) : super(key: key);
  final String? title;
  final Size size;

  @override
  Size get preferredSize => Size(size.width, 48);

  @override
  State<MyAppBar> createState() =>
      _MyAppBarScreenState();
}

class _MyAppBarScreenState extends State<MyAppBar> {

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(widget.size.width, 48),
      child: Container(
        //color: Colors.purple,
        padding: ContainerTheme.padding8,
        decoration: BoxDecoration(
          border: ContainerTheme.bottomBorder(color: Colors.black.withOpacity(0.1)),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/cmt_logo.jpg'
              ),
            ),
            const Expanded(child: SizedBox()),
            ...getMenuItems(
              size: widget.size
            ),
            InkWell(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: const Icon(
                Icons.menu
              ),
            )
          ]
        )
      ),
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
    if(size.width < 768){
      return [];
    }else{
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
                padding: ContainerTheme.paddingVHMedium,
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
}
