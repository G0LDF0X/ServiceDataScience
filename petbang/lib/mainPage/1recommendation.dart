import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petbang/color.dart';
import 'package:get/get.dart';
import 'package:petbang/mainPage/2realEstate.dart';
import 'package:dio/dio.dart';


class Recommendation extends StatefulWidget {
  const Recommendation({Key? key}) : super(key: key);

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  String firstNum = "";
  String secondNum = "";
  String thirdNum = "";
  String firstAvg = "";
  String secondAvg = "";
  String thirdAvg = "";
  String location = "";

  String floorAll = "";
  String floorSale = "";
  String room = "";
  String parkingAvg = "";
  String bath = "";
  String area = "";
  String rate = "";
  String parkingAll = "";
  String tax = "";
  String price = "";

  String first = Get.arguments[0];
  String second = Get.arguments[1];
  String third = Get.arguments[2];

  final Stream<QuerySnapshot> _house = FirebaseFirestore.instance
      .collection('recommend')
      .where("Real Rank", isLessThanOrEqualTo: 1)
      .snapshots();

  void _addSelect(String? select) {
    FirebaseFirestore.instance
        .collection('user')
        .doc('user1')
        .update({'select': location});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainYellow,
          title: const Text('펫방이 제공하는 AI 추천 매물'),
          leading: IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'next page',
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: _buildList());
  }

  Widget _buildList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _house,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Card(
              elevation: 3,
              child: ListTile(
                onTap: () async {
                  var response = await Dio().get('http://10.0.2.2:8888/');
                  print(response.data);


                  firstNum = data['첫 번째 요소 개수'].toStringAsFixed(0);
                  secondNum = data['두 번째 요소 개수'].toStringAsFixed(0);
                  thirdNum = data['세 번째 요소 개수'].toStringAsFixed(0);
                  firstAvg = data['첫 번째 요소 평균 거리(km)'].toStringAsFixed(2);
                  secondAvg = data['두 번째 요소 평균 거리(km)'].toStringAsFixed(2);
                  thirdAvg = data['세 번째 요소 평균 거리(km)'].toStringAsFixed(2);
                  location = data['주소'];

                  floorAll = response.data['건물 전체 층 수'].toString();
                  floorSale = response.data['매매 대상 층 수'].toString();
                  room = response.data['방 개수'].toString();
                  parkingAvg = response.data['세대 당 주차 공간 평균'].toString();
                  bath = response.data['욕실 개수'].toString();
                  area = response.data['전용 면적'].toString();
                  rate = response.data['전용률'].toStringAsFixed(2);
                  parkingAll = response.data['총 주차 공간 개수'].toString();
                  tax = response.data['취득세(만 원)'].toString();
                  price = response.data['평당 가격(만 원)'].toString();

                  // floorSale = data['매매 대상 층 수'].toStringAsFixed(0);
                  // room = data['방 개수'].toStringAsFixed(0);
                  // parkingAvg = data['세대 당 주차 공간 평균'].toStringAsFixed(0);
                  // bath = data['욕실 개수'].toStringAsFixed(0);
                  // area = data['전용 면적'].toStringAsFixed(0);
                  // rate = data['전용률'].toStringAsFixed(0);
                  // parkingAll = data['총 주자 공간 개수'].toStringAsFixed(0);
                  // tax = data['취득세(만 원)'].toStringAsFixed(0);
                  // price = data['평당 가격(만 원)'].toStringAsFixed(0);
                  _addSelect(location);
                  Get.to(() => House(), arguments: [
                    firstNum,
                    secondNum,
                    thirdNum,
                    firstAvg,
                    secondAvg,
                    thirdAvg,
                    location,
                    first,
                    second,
                    third,

                    floorAll,
                    floorSale,
                    room,
                    parkingAvg,
                    bath,
                    area,
                    rate,
                    parkingAll,
                    tax,
                    price
                  ]);
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                leading: Icon(Icons.home),
                //show index number
                title: Text(
                  data['주소'],
                  style: TextStyle(fontSize: 15),
                ),
                trailing: data['Real Rank'] == 0
                    ? Icon(
                        Icons.star,
                        color: mainYellow,
                      )
                    : Text(""),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
