import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_translator/ui/pages/favorite.dart';
import 'package:language_translator/ui/pages/history.dart';
import 'package:language_translator/ui/pages/settings.dart';
import 'package:language_translator/ui/pages/translator.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectIndex = 0;
  List pages = [
    const Translator(),
    FavoritePage(),
    HistoryPage(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 3, 104, 7),
      bottomNavigationBar: ResponsiveNavigationBar(
        activeIconColor: Colors.purple,
        outerPadding: EdgeInsets.zero,
        backgroundColor: const Color.fromARGB(255, 3, 104, 7),
        activeButtonFlexFactor: 100,
        borderRadius: 5.r,
        selectedIndex: selectIndex,
        onTabChange: (int index) {
          setState(() {
            selectIndex = index;
          });
        },
        navigationBarButtons: const [
          NavigationBarButton(
          
            text: 'Home',
            icon: Icons.home,
            
          
            backgroundColor: Colors.white,
          ),
          NavigationBarButton(
            text: 'Favorite',
            icon: Icons.favorite,
            backgroundColor: Colors.white,
          ),
          NavigationBarButton(
            text: 'History',
            icon: Icons.history,
            backgroundColor: Colors.white,
          ),
          NavigationBarButton(
            text: 'Settings',
            icon: Icons.settings,
            backgroundColor: Colors.white,
          ),
        ],
      ),
      body: pages[selectIndex],
    );
  }
}
