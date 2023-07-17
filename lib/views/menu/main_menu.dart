import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakario_app_test/utils/helper/helper.dart';
import 'package:zakario_app_test/views/feature/feature.dart';
import 'package:zakario_app_test/views/home/home.dart';
import 'package:zakario_app_test/views/profile/profile.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;

  final List<Widget> _body = [
    FeaturePage(), //Feature
    HomePage(), // Home
    ProfilePage() // Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFF4C4f5429),
              blurRadius: 10,
              offset: Offset(0, -4),
              spreadRadius: -4,
              blurStyle: BlurStyle.normal,
            ),
          ],
        ),
        child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? Icon(Icons.home)
                    : Icon(Icons.home_outlined),
                label: "Feature",
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? Icon(Icons.menu)
                    : Icon(Icons.menu_outlined),
                label: "Menu",
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? Icon(Icons.people)
                    : Icon(Icons.people_alt_outlined),
                label: "Profile",
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedLabelStyle: tsSecondary.copyWith(fontWeight: fwBold),
            onTap: _onItemTapped),
      ),
    );
  }
}
