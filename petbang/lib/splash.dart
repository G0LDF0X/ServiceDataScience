import 'package:flutter/material.dart';
import 'package:petbang/profile/name.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 2000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Name()));
    });
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(
      Image.asset('assets/images/logo.png').image,
      context,
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40),
                Container(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 300,
                    height: 300,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text(
                    '펫방',
                    style: TextStyle(
                        fontFamily: 'Title', fontSize: 40, letterSpacing: 3.0),
                  ),
                ),
                SizedBox(height: 60),
                Align(
                  child: Text("© Copyright 2022, 펫방(PetBang)",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
