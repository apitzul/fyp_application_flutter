import 'package:flutter/material.dart';
import 'package:fyp_application/chart.dart';
import 'package:fyp_application/constant.dart';
import 'package:fyp_application/homemain.dart';

class StatisticPage extends StatelessWidget {
  StatisticPage({Key? key}) : super(key: key);
  String name = 'huahua';
  String id = '#' + '2019423132';

  @override
  Widget build(BuildContext context) {
    return Container(
        //page :Statistic
        //height: 500,
        //width:350,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
      Padding(
        child: Align(
          child: Text(
            "Statistic",
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
                Padding(
                  child: Text(
                    'Personal Statistic',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  padding: EdgeInsets.only(bottom: 15.0),
                ),
                statsResult(),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    //side: BorderSide(color: kPrimaryLightColor, width: 2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.grey.withOpacity(0.5),
                  child: Container(
                      width: 316, height: 400, child: BarChartSample1()),
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                Text(
                  'Best Statistic',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        //side: BorderSide(color: kPrimaryLightColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      shadowColor: Colors.grey.withOpacity(0.5),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'dgdi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        //side: BorderSide(color: kPrimaryLightColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      shadowColor: Colors.grey.withOpacity(0.5),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'dgdi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        //side: BorderSide(color: kPrimaryLightColor, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      shadowColor: Colors.grey.withOpacity(0.5),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'dgdi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    ]));
  }
}

class statsResult extends StatelessWidget {
  statsResult({Key? key}) : super(key: key);

  int totWord = 122;
  int avgAccValue = 91;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        '     Total \n     Word ',
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
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
            fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
      ),
    ]);
  }
}
