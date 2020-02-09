import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

//import 'dart:async';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:ku/Storage.dart';
import 'package:ku/signin.dart';

import 'package:flutter/foundation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

DateTime now = new DateTime.now();

var day = DateFormat.EEEE().format(now);
var date = DateFormat.yMMMd().format(now);
var time = DateFormat.jm().format(now);

class _HomeState extends State<Home> {
  String dataFromFile;
  List t;
  dynamic token;
  _HomeState({Key key}) {
    dataFromFile = "Empty";
    t = [];
  }
  @override
  void initState() {
    super.initState();
    List ti;
    print("Token Printed!!!");
    Storage userData = new Storage("user.json");
    userData.readData().then((String uData) {
      Map<String, dynamic> savedUser = jsonDecode(uData);
      Map<String, dynamic> tk = savedUser["token"];
      print(tk);
      setState(() {
        token = tk;
      });
    });
//    Storage storage = new Storage("data.json");
//    storage.readData().then((String recordedData) {
//      Map<String, dynamic> jsonData = jsonDecode(recordedData);
//      print("Data: ");
//      List dt = jsonData["docs"];
//      for (int i = 0; i < 6; i++) {
//        if (now.weekday == i) {
//          for (int j = 0; j < dt.length; j++) {
//            int wd = jsonData["docs"][j]["weekDay"];
//            if (wd == i) {
//              print(jsonData["docs"][j]["time"]);
//              //ti.add(jsonData["docs"][j]["time"].toString());
//            }
//          }
//        }
//      }
//      setState(() {
//        dataFromFile = recordedData;
//        t = ti;
//      });
//      print(ti);
//    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
              child: Column(
                children: <Widget>[
                  Text(day, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                  Text(date, style: TextStyle(fontSize: 14.0, color: Colors.black54),),
                ],
              ),
            ),

            FlutterAnalogClock(
              dateTime: DateTime.now(),
              dialPlateColor: Colors.grey[200],
              hourHandColor: Colors.black,
              minuteHandColor: Colors.black,
              secondHandColor: Colors.black54,
              numberColor: Colors.black,
              borderColor: Colors.black,
              tickColor: Colors.redAccent[200],
              centerPointColor: Colors.black45,
              showBorder: true,
              showTicks: true,
              showMinuteHand: true,
              showSecondHand: true,
              showNumber: true,
              borderWidth: 0.0,
              hourNumberScale: 1.0,
              hourNumbers: ['', '', '', '', '', '', '', '', '', '', '', ''],
              isLive: true,
              width: 150.0,
              height: 150.0,
              decoration: const BoxDecoration(),
            ),

            Padding(
              padding: const EdgeInsets.all( 20.0),
              child: DigitalClock(
                digitAnimationStyle: Curves.elasticOut,
                is24HourTimeFormat: false,
                areaDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                hourMinuteDigitDecoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent)
                ),
                hourMinuteDigitTextStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 50,
                ),
                amPmDigitTextStyle: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Card(
                color: Colors.grey[200],
                elevation: 0.0,
                child: ListTile(
                  onTap: getData,
                  title: Text(token.toString()),
                  subtitle: Text(dataFromFile),
                  ),
                ),
              ),
          ],
      ),
    );
  }

  Future<File> getData() async {

    Map<String, String> headers = {"Content-type": "application/json"};

    Response response = await post('https://ku-connect.herokuapp.com/api/data/get', headers: headers, body: token);

    String dataToStore = response.body.toString();
    print(dataToStore);
    Storage storage = new Storage("data.json");
    return storage.writeData(dataToStore);
  }
}