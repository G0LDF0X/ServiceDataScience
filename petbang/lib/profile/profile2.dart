import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petbang/profile/searchLocation.dart';
import 'package:petbang/color.dart';

class ProfilePage2 extends StatefulWidget {
  const ProfilePage2({Key? key}) : super(key: key);

  @override
  State<ProfilePage2> createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
  String name = Get.arguments[0];
  String first = Get.arguments[1];
  String second = Get.arguments[2];
  String third = Get.arguments[3];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          }
        ),
        //BackButton(),
        title: Text(
          '프로필 설정',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Noto',
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          _buildTop(),
          _buildMiddle(),
        ],
      ),
      bottomSheet: _buildBottom(),
    );
  }

  Widget _buildTop() {
    return Container(
        //margin: const EdgeInsets.only(top: 24.0),
        height: 300,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 24),
        child: Image.asset('assets/images/logo.png'));
  }

  Widget _buildMiddle() {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(children: [
            TextSpan(
              text: '프로필 설정 완료\n',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  height: 1.8,
                  fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: 'AI를 통해',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  height: 1.8,
                  fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: ' Best 매물 ',
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xffFCAF17),
                  height: 1.8,
                  fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: '을 추천해드릴게요!',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  height: 1.8,
                  fontWeight: FontWeight.w700),
            ),
          ])),
    );
  }

  Widget _buildBottom() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: subYellow,
      height: 60,
      child: TextButton(
        child: Text(
          'FINISH',
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              letterSpacing: 3.0),
        ),
        onPressed: () {
          Get.to(()=>Search(), arguments:[name, first, second, third]);
        },
      ),
    );
  }
}
