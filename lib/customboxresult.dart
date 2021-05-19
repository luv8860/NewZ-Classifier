import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_classifier/custombox.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class CustomDialogBox2 extends StatefulWidget {
  final String text;
  const CustomDialogBox2(
      {Key key,
      this.text,
      })
      : super(key: key);

  @override
  _CustomDialogBox2State createState() => _CustomDialogBox2State(
      text,
      );
}

class _CustomDialogBox2State extends State<CustomDialogBox2> {
  final String text;
  _CustomDialogBox2State(
      this.text,
     );
  String url = "https://newz-classifier.herokuapp.com/";
  var urll;
  void getname() async {
    var send = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
            {
                "text":text,
              }
            ));
    final decode = json.decode(send.body);
    setState(() {
      print(decode.toString() + 'main');
      urll = decode['result'];
      print(urll);
    });
  }

  @override
  void initState() {
    super.initState();
    getname();
  }

  @override
  Widget build(BuildContext context) {
    if (urll == null) {
      return Center(
          child: Container(
              height: 200, width: 200, child: CircularProgressIndicator()));
    } else {
      return CustomDialogBox(
          title: "Result",
          descriptions: urll == 0
              ? "Politics"
              : urll == 1
              ? "Technology"
              :urll == 2
              ? "Entertainment"
              :"Business",
          text: "OK");
    }
  }
}
