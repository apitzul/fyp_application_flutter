import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fyp_application/constant.dart';
import 'package:fyp_application/homemain.dart';
import 'package:fyp_application/page/homepage.dart';
import 'package:fyp_application/login.dart';
import 'package:fyp_application/page/trainsessionpage.dart';
import 'package:fyp_application/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: (() {
          bool rembMe = true;
          if (rembMe == true)
            //return LoginWidget();
            //return TrainingSession();
            return HomeMain();

          return Welcome();
        }()));
  }
}
