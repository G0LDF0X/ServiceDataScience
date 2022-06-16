import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:petbang/profile/profile2.dart';
import 'package:petbang/color.dart';

class ProfilePage1 extends StatefulWidget {
  const ProfilePage1({Key? key}) : super(key: key);

  @override
  _ProfilePage1State createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  String name = Get.arguments;

  void _addFirst(String? first) {
    FirebaseFirestore.instance
        .collection('user')
        .doc('user1')
        .update({'first': first});
  }

  void _addSecond(String? second) {
    FirebaseFirestore.instance
        .collection('user')
        .doc('user1')
        .update({'second': second});
  }

  void _addThird(String? third) {
    FirebaseFirestore.instance
        .collection('user')
        .doc('user1')
        .update({'third': third});
  }

  final List<String> _items1 = ['동물병원', '동물약국', '동물미용', '동물호텔', '동물카페', '산책로'];
  String selectedValue1 = '동물병원';

  final List<String> _items2 = ['동물병원', '동물약국', '동물미용', '동물호텔', '동물카페', '산책로'];
  String selectedValue2 = '동물병원';

  final List<String> _items3 = ['동물병원', '동물약국', '동물미용', '동물호텔', '동물카페', '산책로'];
  String selectedValue3 = '동물병원';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          '프로필 설정',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Noto',
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          _buildTop(),
          _buildMiddle(),
        ],
      ),
      bottomSheet: _buildBottom(),
    );
  }

  Widget _buildTop() {
    return Material(
      child: Container(
        height: 120,
        margin: const EdgeInsets.only(top: 8.0, bottom: 16),
        alignment: Alignment.center,
        child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(children: [
              TextSpan(
                text: '\n반려동물과 함께 사는 부동산 매물을 선택할 때,\n고려사항을 중요한 순서대로 선택해주세요\n',
                style:
                    TextStyle(fontSize: 16, color: Colors.black, height: 1.8),
              ),
              TextSpan(
                text: '(순위별로 다른 항목을 선택해주세요)',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    height: 1.8,
                    fontWeight: FontWeight.bold),
              ),
            ])),
      ),
    );
  }

  Widget _buildMiddle() {
    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                child: Text(
                  '1',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                color: mainYellow,
              ),
              Container(
                height: 50,
                width: 20,
              ),
              Container(
                  height: 50,
                  width: 200,
                  child: DropdownButton(
                    isExpanded: true,

                    hint: Text('1순위를 선택해주세요'),
                    value: selectedValue1,
                    items: _items1.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue1 = value as String;
                      });
                    },
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                child: Text(
                  '2',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                color: mainYellow,
              ),
              Container(
                height: 50,
                width: 20,
              ),
              Container(
                  height: 50,
                  width: 200,
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text('2순위를 선택해주세요'),
                    value: selectedValue2,
                    items: _items2.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue2 = value as String;
                      });
                    },
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                child: Text(
                  '3',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                color: mainYellow,
              ),
              Container(
                height: 50,
                width: 20,
              ),
              Container(
                  height: 50,
                  width: 200,
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text('3순위를 선택해주세요'),
                    value: selectedValue3,
                    items: _items3.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue3 = value as String;
                      });
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: subYellow,
      height: 60,
      child: TextButton(
        child: Text(
          'NEXT',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 2.0,
            color: Colors.black,
            fontWeight: FontWeight.w700
          ),
        ),
        onPressed: () {
          _addFirst(selectedValue1);
          _addSecond(selectedValue2);
          _addThird(selectedValue3);
          Get.to(() => ProfilePage2(), arguments: [
            name,
            selectedValue1,
            selectedValue2,
            selectedValue3
          ]);
        },
      ),
    );
  }
}
