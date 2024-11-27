import 'package:betak/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 25,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      unselectedItemColor: const Color(0xFF455A64),
      selectedItemColor: Styles.blueSky,
      unselectedLabelStyle: Styles.styleBoldIrinaSans12,
      selectedLabelStyle: Styles.styleBoldIrinaSans12,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 14),
              child: Icon(
                Icons.person,
              ),
            ),
            label: 'الحساب'),
        BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 14),
              child: Icon(
                Icons.search,
              ),
            ),
            label: 'بحث'),
        BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 14),
              child: Icon(
                FontAwesomeIcons.truck,
                size: 25,
              ),
            ),
            label: 'شحن'),
        BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 14),
              child: Icon(
                Icons.category_outlined,
              ),
            ),
            label: 'الفئات'),
        BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 14),
              child: Icon(
                FontAwesomeIcons.houseChimney,
              ),
            ),
            label: 'الرئيسية'),
      ],
    );
  }
}
