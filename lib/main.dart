import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftdicenumber = 1;
  void changediceface() {
    setState(() {
      leftdicenumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent[400],
        appBar: AppBar(
          title: Text('My Dice'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Column(children: [
            SizedBox(
              height: 150.0,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(90.0),
                              topRight: Radius.circular(90.0),
                              bottomLeft: Radius.circular(90.0),
                              bottomRight: Radius.circular(90.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 60.0,
                              spreadRadius: 10.0,
                              // offset:
                              //     Offset(0.0, 0.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: InkWell(
                            onTap: () {
                              changediceface();
                            },
                            child:
                                Image.asset('images/dice$leftdicenumber.png')),
                        margin: EdgeInsets.all(30.0))),
              ],
            ),
            Column(children: [
              SizedBox(
                height: 90.0,
              ),
              FlatButton(
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Designed by Kalinga. ©2021 All Rights Reserved.',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  launch('https://www.github.com/KalingaAbhisek/');
                },
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
