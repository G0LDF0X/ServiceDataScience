import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petbang/mainPage/1recommendation.dart';
import 'package:petbang/color.dart';

class House extends StatefulWidget {
  const House({Key? key}) : super(key: key);

  @override
  State<House> createState() => _HouseState();
}

class _HouseState extends State<House> {
  String firstNum = Get.arguments[0];
  String secondNum = Get.arguments[1];
  String thirdNum = Get.arguments[2];
  String firstAvg = Get.arguments[3];
  String secondAvg = Get.arguments[4];
  String thirdAvg = Get.arguments[5];
  String location = Get.arguments[6];
  String first = Get.arguments[7];
  String second = Get.arguments[8];
  String third = Get.arguments[9];

  String floorAll = Get.arguments[10];
  String floorSale = Get.arguments[11];
  String room = Get.arguments[11];
  String parkingAvg = Get.arguments[13];
  String bath = Get.arguments[14];
  String area = Get.arguments[15];
  String rate = Get.arguments[16];
  String parkingAll = Get.arguments[17];
  String tax = Get.arguments[18];
  String price = Get.arguments[19];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          floating: true,
          pinned: true,
          expandedHeight: 250,
          backgroundColor: mainYellow,
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1,
            title: Text(location,
                style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.5, 0.5),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            background: Image.asset(
              'assets/images/city.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFillRemaining(hasScrollBody: false, child: _body())
      ],
    ));
  }

  Widget _body() {
    return Column(
      children: [
        Card(
          elevation: 4.0,
          child: ExpansionTile(
            title: Text(
              '단지 요약정보',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black),
            ),
            initiallyExpanded: false,
            backgroundColor: Colors.white,
            children: [
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 200,
                          child: Text('건물 전체 증 수',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$floorAll 층',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 200,
                          child: Text('매매 대상 층 수',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$floorSale 층',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 200,
                          child: Text('총 주자 공간 개수',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$parkingAll 개',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 200,
                          child: Text('세대 당 주차 공간 평균',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$parkingAvg 개',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          elevation: 4.0,
          child: ExpansionTile(
            title: Text(
              '타입 정보',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black),
            ),
            initiallyExpanded: false,
            backgroundColor: Colors.white,
            children: [
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 150,
                          child: Text('방 개수',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$room 개',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 150,
                          child: Text('욕실 개수',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$bath 개',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 150,
                          child: Text('전용 면적',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$area ㎡',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 150,
                          child: Text('전용률',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$rate %',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 150,
                          child: Text('취득세',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$tax 만 원',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 150,
                          child: Text('평당 가격',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$price 만 원',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          elevation: 4.0,
          child: ExpansionTile(
            title: Text(
              'AI 분석결과',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black),
            ),
            initiallyExpanded: false,
            backgroundColor: Colors.white,
            children: [
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 50,
                          child: Text('1 순위',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          width: 80,
                          child: Text('$first',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Container(
                          child: Text(' 1km 이내에 ',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$firstNum 개 ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Container(
                          child: Text('있습니다',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                      ),
                      Container(
                          child: Text(' 평균 ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ))),
                      Container(
                          child: Text('$firstAvg km ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Container(
                          child: Text('떨어져 있습니다 ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ))),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 50,
                          child: Text('2 순위',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          width: 80,
                          child: Text('$second',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Container(
                          child: Text(' 1km 이내에 ',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$secondNum 개 ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Container(
                          child: Text('있습니다',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                      ),
                      Container(
                          child: Text(' 평균 ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ))),
                      Container(
                          child: Text('$secondAvg km ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Container(
                          child: Text('떨어져 있습니다 ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ))),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[300],
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                          width: 50,
                          child: Text('3 순위',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          width: 80,
                          child: Text('$third',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Container(
                          child: Text(' 1km 이내에 ',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                      Container(
                          child: Text('$thirdNum 개 ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Container(
                          child: Text('있습니다',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                // width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                      ),
                      Container(
                          child: Text(' 평균 ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ))),
                      Container(
                          child: Text('$thirdAvg km ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))),
                      Container(
                          child: Text('떨어져 있습니다 ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
