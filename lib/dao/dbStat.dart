import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:fyp_application/class/userStat.dart';

class userStatDao {
  final DatabaseReference _dbUserStat = FirebaseDatabase.instance
      .refFromURL(
          'https://fyp-app-c0bc1-default-rtdb.asia-southeast1.firebasedatabase.app/')
      .child('fyp-app/userStat');

  void saveUserStat(UserStat userStart) {
    _dbUserStat.push().set(userStart.toJson());
  }

  Query getUserStatQuery() {
    print(_dbUserStat);
    return _dbUserStat;
  }

  Future<Map<String, dynamic>> getSnapshot() async {
    final _dbUserStat = FirebaseDatabase.instance.ref();
    final snapshot = await _dbUserStat.child('fyp-app/userStat').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
    return snapshot.value as Map<String, dynamic>;
  }
}
