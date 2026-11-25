import 'package:a1/pages/add_page.dart';
import 'package:a1/pages/my_page.dart';
import 'package:a1/pages/home_page.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  List pages = [
    HomePage(),
    AddPage(),
    MyPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value){
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "My"),
          ]
      ),
    );
  }
}
