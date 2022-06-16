import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'profile/profile1.dart';
import 'profile/profile2.dart';
import 'profile/name.dart';
import 'profile/searchLocation.dart';
import 'mainPage/1recommendation.dart';
import 'package:get/get.dart';
import 'color.dart';
import 'splash.dart';
import 'mainPage/2realEstate.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        '/profile1': (context) => const ProfilePage1(),
        '/profile2': (context) => const ProfilePage2(),
        '/search': (context) => const Search(),
        '/name': (context) => const Name(),
        '/recommendation': (context) => const Recommendation(),
        '/splash': (context) => const Splash()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Noto',
        primaryColor: mainYellow,
      ),
      home: Splash(),
    );
  }
}
