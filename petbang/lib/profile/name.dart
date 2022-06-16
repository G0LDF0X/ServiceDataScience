import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petbang/profile/profile1.dart';
import 'package:petbang/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  FocusNode textFocus = FocusNode();
  final _textController = TextEditingController();
  String name = "";

  void _addName(String? name) {
    FirebaseFirestore.instance
        .collection('user')
        .doc('user1')
        .update({'name': name});
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        textFocus.unfocus();
      },
      child: Scaffold(
        backgroundColor: subYellow,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  '펫방 프로필 만들기',
                  style: TextStyle(
                      fontSize: 25, height: 3, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                  child: Text(
                '이름을 입력하세요',
                style: TextStyle(fontSize: 20),
              )),
              Container(
                height: 60,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  focusNode: textFocus,
                  controller: _textController,
                  autofocus: false,
                  style: TextStyle(
                      fontSize: 25, color: Colors.black, letterSpacing: 5),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: _textController.clear,
                        icon: Icon(
                          Icons.clear,
                          color: mainGrey,
                        ),
                      )),
                ),
              ),
              Container(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: subGrey,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.7, 50)),
                  onPressed: () {
                    setState(() {
                      name = _textController.text;
                    });
                    _addName(name);
                    Get.to(ProfilePage1(), arguments: name);
                  },
                  child: Text(
                    '다음',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
