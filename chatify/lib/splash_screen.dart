import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';
import 'main_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x7470c8ba), CupertinoColors.white],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130.0),
            child: SizedBox(
              width: 180,
              height: 180,
              child: Lottie.asset('images/chat_animation.json'),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Welcome to Chatify',
            style: TextStyle(
              fontSize: 23,
              color: CupertinoColors.white,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 90,top: 190),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Color(0xff65b9ac),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                  side: BorderSide(color: CupertinoColors.white)
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatifyMainLayout(),));
              },
              child: Row(
                spacing: 7,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Get Started',style: TextStyle(color: CupertinoColors.white),), Icon(Icons.navigate_next,color: CupertinoColors.white,)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 190),
            child: Text(
              'Developed by MD JAHIR',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 11,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
