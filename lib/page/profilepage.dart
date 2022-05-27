import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp_application/constant.dart';
import 'package:fyp_application/homemain.dart';

class ProfilePage extends StatelessWidget {
  String name = 'huahua';
  String id = '#' + '2019423132';
  int totWord = 122;
  int avgAccValue = 91;

  @override
  Widget build(BuildContext context) {
    return Container(
        //page :Profile
        //height: 500,
        //width:350,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
      Padding(
        child: Align(
          child: Text(
            "Profile",
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Icon(
                  Icons.account_circle,
                  size: 100,
                  color: kPrimaryColor,
                )),
                Text(
                  name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  id,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '     Total \n     Word ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      //1st card
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: kPrimaryColor, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.grey.withOpacity(0.3),
                        child: Container(
                          width: 70,
                          height: 40,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              totWord.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      //2nd card
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: avgAccValue > 80
                                  ? Colors.greenAccent
                                  : avgAccValue > 60
                                      ? Colors.limeAccent
                                      : avgAccValue > 40
                                          ? Colors.yellowAccent
                                          : avgAccValue > 20
                                              ? Colors.orangeAccent
                                              : Colors.redAccent,
                              width: 2),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        shadowColor: Colors.grey.withOpacity(0.3),
                        child: Container(
                          width: 70,
                          height: 40,
                          color: Colors.white,
                          child: Center(
                              child: Stack(
                            children: [
                              Center(
                                  child: Text(
                                '% %',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.05),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )),
                              Center(
                                child: Text(
                                  avgAccValue.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                        ),
                      ),

                      Text(
                        ' Average\n Accuracy',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ]),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                Text(
                  'Profile Detail :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Text(
                  '\n adwa adwadawdawd awdawd',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ],
            ),
          )),
    ]));
  }
}
