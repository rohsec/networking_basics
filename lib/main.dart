import 'dart:io';

import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learning_basics/screens/home.dart';
import 'package:learning_basics/screens/serach.dart';
import 'package:learning_basics/screens/settings.dart';
import 'package:learning_basics/util/enum/api_request_status.dart';

import 'config.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PageController _pageController;
  int _page = 0;
//  int _selectedindex=0;

//   List<Widget> _widgetList =<Widget>[
//    Home(),
//    Search(),
//    Settings(),
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Config.appName) ,),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Home(),
          Search(),
          Settings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey[500],
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text(
              'Explore',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: Text(
              'Settings',
            ),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
  }
