import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:fyp_application/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

class TrainingSession extends StatefulWidget {
  const TrainingSession({Key? key}) : super(key: key);

  @override
  State<TrainingSession> createState() => _TrainingSessionState();
}

class _TrainingSessionState extends State<TrainingSession> {
  String output1 = '0';
  double accuracy = 0;
  String output2 = '.....';
  final String _targetText = 'Hello my friend';
  bool _isDone = false;
  bool isRecorderReady = false;

  final audioPlayer = AssetsAudioPlayer();
  late String filepath;
  String audiopath = '/storage/emulated/0/Download/audio.wav';
  final _myRecorder = FlutterSoundRecorder();
  String url = 'http://0.tcp.ap.ngrok.io:13380/';
  String? message;

  uploadAudio() async {
    final request = http.MultipartRequest("POST", Uri.parse(url + 'upload'));
    final headers = {"ContentType": "multipart/form-data"};
    final audio = File(audiopath);
    request.files.add(http.MultipartFile(
        'audio', audio.readAsBytes().asStream(), audio.lengthSync(),
        filename: _targetText + '.wav'));

    request.headers.addAll(headers);
    final response = await request.send();

    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['message'];

    setState(() {});
  }

  getResult() async {
    final http.Response response = await http.get(Uri.parse(url + 'api'));

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;

    setState(() {
      output1 = decoded['output1'].toString();
      output2 = decoded['output2'];
      accuracy = decoded['output1'] / 100;
      if (_isDone == false) _isDone = !_isDone;
    });
  }

  Future record() async {
    if (!isRecorderReady) return;

    await _myRecorder.startRecorder(toFile: audiopath);
  }

  Future stop() async {
    if (!isRecorderReady) return;
    final path = await _myRecorder.stopRecorder();
    final audioFile = File(path!);
    uploadAudio();
    debugPrint('Recorded Audio: $audioFile');
    await Future.delayed(Duration(seconds: 1));
    getResult();
  }

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    _myRecorder.closeRecorder();
    super.dispose();
  }

  Future initRecorder() async {
    //debugPrint('WOWOWOWOWOWOWOWOW');
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await _myRecorder.openRecorder();
    isRecorderReady = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/bg0.png"),
            fit: BoxFit.cover,
          )),
          alignment: Alignment.center,
          child: PageView(physics: NeverScrollableScrollPhysics(), children: <
              Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    child: Align(
                      child: Text(
                        "Training Session",
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
                        height: 650,
                        width: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Divider(
                              indent: 20,
                              endIndent: 20,
                            ),
                            Transform.scale(
                              scaleX: -1,
                              scaleY: -1,
                              child: Icon(
                                Icons.format_quote,
                                size: 20,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                child: Text(
                                  _targetText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )),
                            Icon(
                              Icons.format_quote,
                              size: 20,
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                            ),
                            Text(
                              "Transcribed Sentences:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                              child: Text(
                                output2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularPercentIndicator(
                                  //average acc
                                  radius: 30.0,
                                  lineWidth: 10.0,
                                  animation: true,
                                  percent: accuracy,
                                  center: Text(
                                    _isDone ? output1 + "%" : "...",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  footer: Text(
                                    "Accuracy",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.purple,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  child: CircularPercentIndicator(
                                    //current acc
                                    radius: 40.0,
                                    lineWidth: 10.0,
                                    animation: true,
                                    percent: accuracy,
                                    center: Text(
                                      _isDone ? output1 + "%" : "...",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    footer: Text(
                                      "Accuracy",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.purple,
                                  ),
                                ),
                                CircularPercentIndicator(
                                  //average acc
                                  radius: 30.0,
                                  lineWidth: 10.0,
                                  animation: true,
                                  percent: accuracy,
                                  center: Text(
                                    _isDone ? output1 + "%" : "...",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  footer: Text(
                                    "Accuracy",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                            ),
                            Text(
                              "Feedback:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                debugPrint(
                                    'Recorded Audio: $_myRecorder.isRecording');
                                if (_myRecorder.isRecording) {
                                  await stop();
                                } else {
                                  await record();
                                }
                                setState(() {});
                              },
                              child: Icon(_myRecorder.isRecording
                                  ? Icons.stop
                                  : Icons.mic),
                            ),
                          ],
                        ),
                      )),
                ]),
          ])),
    );
  }
}
