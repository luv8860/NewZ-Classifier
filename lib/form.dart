import 'package:flutter/material.dart';
import 'custombox.dart';
import 'customboxresult.dart';
import 'dart:ui' show ImageFilter;


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String text;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(27, 95, 13, 1),
                  Color.fromRGBO(249, 248, 113, 1)
                ]),
          ),
          child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('NewZ Classifier',
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 40)),
                    SizedBox(
                      width: 15.0,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        showGeneralDialog(
                          barrierDismissible: true,
                          barrierLabel: '',
                          barrierColor: Colors.black38,
                          transitionDuration: Duration(milliseconds: 100),
                          pageBuilder: (ctx, anim1, anim2) => CustomDialogBox(
                              title: "How to use This App",
                              descriptions:
                                  "Enter The News headline below to find out the category in which it lies",
                              text: "OK"),
                          transitionBuilder: (ctx, anim1, anim2, child) =>
                              BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 4 * anim1.value,
                                sigmaY: 4 * anim1.value),
                            child: FadeTransition(
                              child: child,
                              opacity: anim1,
                            ),
                          ),
                          context: context,
                        );
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                          width: 300,
                          child:TextFormField(
                              onChanged: (value) {
                                text = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter The Headline',
                                hintStyle: TextStyle(color: Colors.white),
                              ))),
                      SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green),
                        child: Center(
                          child: ButtonTheme(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              minWidth: 200.0,
                              child: FlatButton(
                                  onPressed: () {
                                    showGeneralDialog(
                                      barrierDismissible: true,
                                      barrierLabel: '',
                                      barrierColor: Colors.black38,
                                      transitionDuration:
                                          Duration(milliseconds: 100),
                                      pageBuilder: (ctx, anim1, anim2) =>
                                          CustomDialogBox2(
                                              text:text),
                                      transitionBuilder:
                                          (ctx, anim1, anim2, child) =>
                                              BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4 * anim1.value,
                                            sigmaY: 4 * anim1.value),
                                        child: FadeTransition(
                                          child: child,
                                          opacity: anim1,
                                        ),
                                      ),
                                      context: context,
                                    );
                                  },
                                  child: Text(
                                    "Check The Data",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
