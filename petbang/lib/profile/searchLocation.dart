import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:petbang/color.dart';
import 'package:petbang/mainPage/1recommendation.dart';
import 'package:dio/dio.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String result = "";

  String name = Get.arguments[0];
  String first = Get.arguments[1];
  String second = Get.arguments[2];
  String third = Get.arguments[3];

  var _locationController = TextEditingController();
  FocusNode textFocus = FocusNode();

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  void _addLocation(String location) {
    FirebaseFirestore.instance
        .collection('user')
        .doc('user1')
        .update({'location': location});
    _locationController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          textFocus.unfocus();
        },
        child: Scaffold(body: _searchBar(), bottomSheet: _buildBottom()));
  }

  Widget _searchBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 380,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            focusNode: textFocus,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: _locationController.clear,
                icon: const Icon(Icons.clear),
              ),
              border: InputBorder.none,
              // labelText: '',
              hintText: '위치를 입력하세요. ( ex. OO시로 검색 )',
            ),
            controller: _locationController,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: '  ${name}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: ' 님의 프로필',
                        style: TextStyle(color: Colors.black, fontSize: 16.0)),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              margin: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              decoration: BoxDecoration(
                color: subYellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '반려동물과 함께 살 집을 찾고 있어요!\n',
                      style: TextStyle(
                          fontSize: 16, color: Colors.black, height: 2),
                    ),
                    TextSpan(
                      text: '${first}, ${second}, ${third}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 2),
                    ),
                    TextSpan(
                      text: '  중요해요',
                      style: TextStyle(
                          fontSize: 16, color: Colors.black, height: 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottom() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xffFDB913),
      height: 60,
      child: TextButton(
          child: Text(
            '펫방 매물찾기',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          onPressed: () async {
            var response = await Dio().post('http://10.0.2.2:8080/');
            _addLocation(_locationController.text);
            Get.to(() => const Recommendation(),
                arguments: [first, second, third]);
          }),
    );
  }
}
