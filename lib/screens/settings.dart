import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: ConnectionStatusBar(
            height: 25,
            width: double.maxFinite,
            color: Colors.redAccent,
            lookUpAddress: 'google.com',
            endOffset: const Offset(0.0, 0.0),
            beginOffset: const Offset(0.0, -1.0),
            animationDuration: const Duration(milliseconds: 200),
            title: const Text(
              'Please check your internet connection',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),

          ),
        ),
        Container(child: Center(
          child: Text('Settings'),
        ),),
      ],
    );
  }
}
