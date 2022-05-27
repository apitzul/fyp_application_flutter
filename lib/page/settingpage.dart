import 'package:flutter/material.dart';
import 'package:fyp_application/constant.dart';
import 'package:fyp_application/homemain.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //page :Setting
        //height: 500,
        //width:350,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Padding(
            child: Align(
              child: Text(
                "Setting",
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
                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                ),
              )),
        ]));
  }
}
