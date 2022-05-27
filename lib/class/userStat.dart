import 'package:firebase_database/firebase_database.dart';

class UserStat {
  int? id;
  int? averageAcc;
  String? email;
  int? counter;
  //String? sentences;

  UserStat(this.id, this.averageAcc, this.email, this.counter);

  Map<String, dynamic> toJson() => {
        'id': id,
        'averageAcc': averageAcc,
        'email': email,
        'counter': counter,
      };

  UserStat.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as int,
        averageAcc = json['average'] as int,
        email = json['email'] as String,
        counter = json['counter'] as int;

  UserStat.fromSnapshot(snapshot)
      : id = snapshot.value['id'],
        averageAcc = snapshot.value['average'],
        email = snapshot.value['email'],
        counter = snapshot.value['counter'];
}
