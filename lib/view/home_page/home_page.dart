
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyujin_app/view/home_page/profile_page.dart';
import 'package:kyujin_app/view/home_page/company_favorite_page.dart';
import 'package:kyujin_app/view/home_page/company_message_page.dart';
import 'package:kyujin_app/view/home_page/company_search_page.dart';
import 'package:kyujin_app/view/home_page/menu_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    CompanySearchPage(),
    CompanyFavoritePage(),
    CompanyMessagePage(),
    ProfilePage(),
    MenuPage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _BottomNavigationBar(
          onTap: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}

class _BottomNavigationBar extends ConsumerWidget {
  const _BottomNavigationBar(
      {required this.selectedIndex, required this.onTap});
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BottomNavigationBarItem buildBottomNavigationBarItem(String label, int index, {bool addBadge = false}) {
      final bool isSelected = index == selectedIndex;
      return BottomNavigationBarItem(
        icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              if (index == 0)
                isSelected
                    ? const Icon(Icons.search_outlined,color: Colors.lime)
                    : const Icon(Icons.search_outlined,color: Colors.grey),
              if (index == 1)
                isSelected
                    ? const Icon(Icons.star,color: Colors.lime)
                    : const Icon(Icons.star,color: Colors.grey),
              if (index == 2)
                isSelected
                    ? const Icon(Icons.message,color: Colors.lime)
                    : const Icon(Icons.message,color: Colors.grey),
              if (index == 3)
                isSelected
                    ? const Icon(Icons.account_circle,color: Colors.lime)
                    : const Icon(Icons.account_circle,color: Colors.grey),
              if (index == 4)
                isSelected
                    ? const Icon(Icons.keyboard_control_outlined,color: Colors.lime)
                    : const Icon(Icons.keyboard_control_outlined,color: Colors.grey),
              ],
        ),
        label: label,
      );
    }
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          buildBottomNavigationBarItem('求人を探す', 0),
          buildBottomNavigationBarItem('気になる', 1),
          buildBottomNavigationBarItem('メッセージ', 2),
          buildBottomNavigationBarItem('プロフィール', 3),
          buildBottomNavigationBarItem('その他', 4),
        ],
        currentIndex: selectedIndex,
        backgroundColor: Colors.grey[800],
        selectedItemColor: Colors.lime,
        unselectedItemColor: Colors.grey,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        selectedLabelStyle:
        const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
        const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
      ),
    );
  }
}