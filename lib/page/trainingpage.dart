import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fyp_application/class/cardContent.dart';
import 'package:fyp_application/constant.dart';
import 'package:fyp_application/dao/dbContent.dart';
import 'package:fyp_application/dao/dbStat.dart';
import 'package:fyp_application/homemain.dart';
import 'package:fyp_application/class/userStat.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  // ignore: deprecated_member_use

  String _displayText = "woooooow";
  int userId = 1;
  final _contentDao = ContentDao();

  @override
  Widget build(BuildContext context) {
    return Container(
        //page :Training
        //height: 500,
        //width:350,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Padding(
            child: Align(
              child: Text(
                "Training",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(5, 5),
                          blurRadius: 15)
                    ]),
              ),
              alignment: Alignment.center,
            ),
            padding: EdgeInsets.only(bottom: 15.0),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                  color: Colors.white,
                  height: sizeCardH,
                  width: sizeCardW,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Text(
                            'Training Session',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        Expanded(
                          flex: 3,
                          child: FirebaseAnimatedList(
                              query: _contentDao.getContentQuery(),
                              itemBuilder: (BuildContext context,
                                  DataSnapshot snapshot,
                                  Animation<double> animation,
                                  int index) {
                                return _Cards(
                                  snapshot: snapshot,
                                  userId: userId,
                                );
                              }),
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  ))),
        ]));
  }
}

class _Cards extends StatelessWidget {
  //const _Cards({Key? key}) : super(key: key);

  late DataSnapshot snapshot;
  late int userId;

  _Cards({
    required this.snapshot,
    required this.userId,
  });

  final _userStatDao = userStatDao();

  @override
  Widget build(BuildContext context) {
    final _isOnGoing = true;
    final output1;
    final accuracy;

    Query statSnapshot = _userStatDao.getUserStatQuery();

    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadowColor: Colors.grey.withOpacity(0.3),
        child: Container(
          width: 320,
          height: 85,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      CardContent.fromSnapshot(snapshot).image.toString()),
                  fit: BoxFit.fitWidth,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  alignment: Alignment.center)),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        CardContent.fromSnapshot(snapshot)
                            .word
                            .toString()
                            .toUpperCase(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 92, 11, 112),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        CardContent.fromSnapshot(snapshot)
                            .sentences[1]
                            .toString(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 66, 10, 80),
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Expanded(
                      child: CircularPercentIndicator(
                    radius: 25.0,
                    lineWidth: 5.0,
                    animation: true,
                    percent: _isOnGoing ? 0.8 : 0, //percent 0-1
                    center: Text(
                      _isOnGoing ? "80" + "%" : "...",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                    footer: Text(
                      "Accuracy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                  )),
                  Expanded(
                    child: FirebaseAnimatedList(
                        query: _userStatDao.getUserStatQuery(),
                        itemBuilder: (BuildContext context,
                            DataSnapshot snapshotStat,
                            Animation<double> animation,
                            int index) {
                          print(CardContent.fromSnapshot(snapshot)
                              .word
                              .toString());

                          print(UserStat.fromSnapshot(snapshotStat)
                              .email
                              .toString());

                          if (CardContent.fromSnapshot(snapshot) //condition
                                  .word
                                  .toString() ==
                              UserStat.fromSnapshot(snapshotStat)
                                  .email
                                  .toString()) {
                            return CircularPercentIndicator(
                                radius: 25.0,
                                lineWidth: 5.0,
                                animation: true,
                                percent: _isOnGoing ? 0.8 : 0, //percent 0-1
                                center: Text(
                                  _isOnGoing ? "80" + "%" : "...",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                                footer: Text(
                                  UserStat.fromSnapshot(snapshotStat)
                                      .counter
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ));
                          } else {
                            return Text("No Info");
                          }
                          ;
                        }),
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

/*
 FirebaseAnimatedList(
                  query: _userStatDao.getUserStatQuery(),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: _isOnGoing ? 80 : 0,
                      center: Text(
                        _isOnGoing ? "80" + "%" : "...",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      footer: Text(
                        "Accuracy",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    );
                  })

                  
Flexible(
    child: FirebaseAnimatedList(
        query: contentDao.getContentQuery(),
        itemBuilder: (BuildContext context,
            DataSnapshot snapshot,
            Animation<double> animation,
            int index) {
          return Text("Image:" +
              CardContent.fromSnapshot(snapshot)
                  .image
                  .toString());
        }),
  )


ElevatedButton(
    onPressed: () async {
      try {
        CardContent test =
            CardContent("1", "2", "3");
        contentDao.saveContent(test);

        print("Dah jadiii kot");
      } catch (e) {
        print("You get error!");
      }
    },
    child: Text("hahahah")),

 */