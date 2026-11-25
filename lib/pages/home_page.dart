import 'package:a1/pages/home/explore_page.dart';
import 'package:a1/pages/home/follow_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: [
          Tab(text: "Explore",),
          Tab(text: "Following",)
        ]),
      ),
        body: TabBarView(children: [
          ExplorePage(),
          FollowPage()
        ]),
      ),
    );
  }
}
