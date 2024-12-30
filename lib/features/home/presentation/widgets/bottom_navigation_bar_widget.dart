import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/styles.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 35,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      currentIndex: currentIndex,
      backgroundColor: Colors.grey[200],
      unselectedItemColor: const Color(0xFF455A64),
      selectedItemColor: Styles.blueSky,
      unselectedLabelStyle: Styles.styleBoldIrinaSans12,
      selectedLabelStyle: Styles.styleBoldIrinaSans12,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.category_outlined,
          ),
          label: 'منتجاتي',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.houseChimney,
            ),
            label: 'الرئيسية'),
      ],
    );
  }
}
