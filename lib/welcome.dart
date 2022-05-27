

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:fyp_application/constant.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages:[
        PageViewModel(
          title: 'Hiadwadadadsda',
          body: 'gila gila la',
          image:buildImage('assets/images/Speech_Therapy.png'),
          decoration: getPageDecoration(),
        ),

        PageViewModel(
          title: 'Hsfefsef',
          body: 'fuyoooa',
          image:buildImage('assets/images/Speech_Therapy.png'),
          decoration: getPageDecoration(),
        ),

        PageViewModel(
          title: 'sgafwafdwadadadsda',
          body: 'haiyaaa',
          image:buildImage('assets/images/Speech_Therapy.png'),
          decoration: getPageDecoration(),
        ),
        ], 
      skip: Text('Skip'),
      showSkipButton: true,
      done: const Text('Login'),
      next: Icon(Icons.arrow_forward),
      onDone: ()=> goToLogin(context), 
      dotsDecorator: getDotsDecoration(),
      
      );
  }


void goToLogin(context) => Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (_) => LoginWidget()),
);

 Widget buildImage(String path) =>
   Center(child: Image.asset(path, width: 200));
 
 DotsDecorator getDotsDecoration() => DotsDecorator(
  color: kPrimaryLightColor,
  activeColor: kPrimaryColor,
  activeSize: Size(22,10),
  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),

 );

 PageDecoration getPageDecoration() => PageDecoration(
  titleTextStyle: TextStyle(fontSize:24,fontWeight: FontWeight.bold),
  bodyTextStyle: TextStyle(fontSize:16,fontWeight: FontWeight.normal),
  descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
  imagePadding: EdgeInsets.all(24),

 );

}
