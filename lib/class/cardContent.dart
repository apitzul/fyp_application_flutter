import 'package:firebase_database/firebase_database.dart';

class CardContent {
  String? id;
  String? word;
  String? image;
  List<Object?> sentences;
  //String? sentences;

  CardContent(this.id, this.word, this.image, this.sentences);

  Map<String, dynamic> toJson() => {
        'id': id,
        'word': word,
        'image': image,
        'sentences': sentences,
      };

  CardContent.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        word = json['word'] as String,
        image = json['image'] as String,
        sentences = json['sentences'] as List<Object>;

  CardContent.fromSnapshot(snapshot)
      : id = snapshot.value['id'],
        word = snapshot.value['word'],
        image = snapshot.value['image'],
        sentences = snapshot.value['sentences'];
}
