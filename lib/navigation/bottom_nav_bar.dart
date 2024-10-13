import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ustudy_app_ui/constants/app_color.dart';
import 'package:ustudy_app_ui/pages/contacts_page/contacts_page.dart';
import 'package:ustudy_app_ui/pages/preparation_page/preparation_page.dart';
import 'package:ustudy_app_ui/pages/tests_page/tests_page.dart';
import 'package:ustudy_app_ui/pages/tutors/tutors_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    PreparationPage(),
    TestsPage(),
    TutorsPage(),
    ContactsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/us_icon.svg',width: 50,height: 50,),
            const SizedBox(width: 8),
            const Text(
              'Ustudy',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(
              icon: _selectedIndex == 0
                  ? 'assets/icons/preparation_active.svg'
                  : 'assets/icons/preparation_inactive.svg',
              label: "Подготовка",
              index: 0,
            ),
            _buildNavItem(
              icon: _selectedIndex == 1
                  ? 'assets/icons/tests_active.svg'
                  : 'assets/icons/tests_inactive.svg',
              label: "Тесты",
              index: 1,
            ),
            _buildNavItem(
              icon: _selectedIndex == 2
                  ? 'assets/icons/tutors_active.svg'
                  : 'assets/icons/tutors_inactive.svg',
              label: "Репетиторы",
              index: 2,
            ),
            _buildNavItem(
              icon: _selectedIndex == 3
                  ? 'assets/icons/contacts_active.svg'
                  : 'assets/icons/contacts_inactive.svg',
              label: "Контакты",
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      {required String icon, required String label, required int index}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 30,
            height: 30,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color:
                  _selectedIndex == index ? AppColor.mainColor : AppColor.grey,
            ),
          ),
        ],
      ),
    );
  }
}
