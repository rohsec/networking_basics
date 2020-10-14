import 'dart:io';

import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learning_basics/screens/home.dart';
import 'package:learning_basics/screens/serach.dart';
import 'package:learning_basics/screens/settings.dart';

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
  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool iswificonnected = false;
  bool isInternetOn = true;
  bool isConnected=true;
  @override
  void initState() {
    // TODO: implement initState
    GetConnect();
    super.initState();
  }
bool isOnline;
  int _selectedindex=0;

   List<Widget> _widgetList =<Widget>[
    Home(),
    Search(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sync),
        onPressed: (){
          GetConnect();
        },
      ),
      appBar: AppBar(
        title: Text('Networking Basics'),
      ),
      body:  _widgetList.elementAt(_selectedindex),
//      isConnected?_widgetList.elementAt(_selectedindex):Center(child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Container(height:100,width: 200,child: Image.asset('assets/images/nointernet.png',fit: BoxFit.contain,)),
//          RaisedButton(child: Text('Retry'),
//          color: Colors.blueAccent,
//            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) ,
//            onPressed: (){
//            print('retry pressed');
//            GetConnect();
//            },
//          )
//        ],
//      ),),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedindex,
        onTap: _itemtapped,
      ),
    );
  }
  void GetConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isConnected=false;
        isInternetOn = false;
      });
    } else if (connectivityResult == ConnectivityResult.mobile) {
     setState(() {
       iswificonnected = false;
       isConnected=true;
     });

    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        iswificonnected = true;
        isConnected=true;
      });
      setState(() async {
        wifiBSSID = await (Connectivity().getWifiBSSID());
        wifiIP = await (Connectivity().getWifiIP());
        wifiName = await (Connectivity().getWifiName());
      });
    }
  }
  void _itemtapped(int index){
    setState(() {
      _selectedindex=index;
    });
  }
}




//<--------------------------------------------------------------------------------------------->
//  final Connectivity _connectivity = Connectivity();
////<--------------------------------------------------------------->
//  /// initialize connectivity checking
//  /// Platform messages are asynchronous, so we initialize in an async method.
//  Future<void> initConnectivity() async {
//    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      await _connectivity.checkConnectivity();
//    } on PlatformException catch (e) {
//      print(e.toString());
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) {
//      return;
//    }
//
//    await _updateConnectionStatus().then((bool isConnected) {
//      if (_connectivitySubscription != null) {
//        if (mounted) {
//          setState(() {
//            isOnline = isConnected;
//          });
//        }
//      }
//    });
//  }
//
//  Future<bool> _updateConnectionStatus() async {
//    bool isConnected;
//    try {
//      final List<InternetAddress> result =
//      await InternetAddress.lookup('google.com');
//      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//        isConnected = true;
//      }
//    } on SocketException catch (_) {
//      isConnected = false;
//      return false;
//    }
//    return isConnected;
//  }
//
//  @override
//  void initState() {
//    super.initState();
//
//    initConnectivity();
//    _connectivitySubscription = Connectivity()
//        .onConnectivityChanged
//        .listen((ConnectivityResult result) async {
//      await _updateConnectionStatus().then((bool isConnected) {
//        if (_connectivitySubscription != null) {
//          setState(() {
//            isOnline = isConnected;
//          });
//        }
//      });
//    });
//  }


//<------------------------------------------->