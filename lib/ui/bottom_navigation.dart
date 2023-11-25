import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_translator/ui/pages/favorite.dart';
import 'package:language_translator/ui/pages/history.dart';
import 'package:language_translator/ui/pages/home_page.dart';
import 'package:language_translator/ui/pages/settings.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectIndex = 0;
  List pages = [
    const MyHomePage(),
    FavoritePage(),
    HistoryPage(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // appBar: AppBar(
      //   title: const Text("Translator App",style: TextStyle(color: Colors.white),),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      bottomNavigationBar: ResponsiveNavigationBar(
        activeIconColor: Colors.purple,
        outerPadding: EdgeInsets.zero,
        backgroundColor: Colors.blue,
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
