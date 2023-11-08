import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seequl/core/resources/strings.dart';
import 'package:seequl/core/seequl/theme.dart';

class AppBottomNav extends StatefulWidget {
  const AppBottomNav({super.key});

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  var allTabs = [
    {'title': 'Apps', 'icon': 'im_3'},
    {'title': 'Qucon', 'icon': 'im_1'},
    {'title': 'Zaady', 'icon': 'im_4'},
    {'title': 'Organize', 'icon': 'im_2'},
    {'title': 'Profile', 'icon': 'im_5'}
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        fixedColor: Palette.textColor,
        currentIndex: 0,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        backgroundColor: Palette.cardColor,
        type: BottomNavigationBarType.fixed,
        onTap: (x) {},
        items: List.generate(
            allTabs.length,
            (index) => BottomNavigationBarItem(
                backgroundColor: Colors.green,
                label: allTabs[index]['title'],
                activeIcon: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: SvgPicture.asset(
                        '$svgPath/${allTabs[index]['icon']}.svg')),
                icon: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: SvgPicture.asset(
                      '$svgPath/${allTabs[index]['icon']}.svg'),
                ))));
  }
}
