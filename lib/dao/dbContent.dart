import 'package:firebase_database/firebase_database.dart';
import 'package:fyp_application/class/cardContent.dart';

class ContentDao {
  final DatabaseReference _dbContent = FirebaseDatabase.instance
      .refFromURL(
          'https://fyp-app-c0bc1-default-rtdb.asia-southeast1.firebasedatabase.app/')
      .child('fyp-app/mainWord');

  void saveContent(CardContent content) {
    _dbContent.push().set(content.toJson());
  }

  Query getContentQuery() {
    return _dbContent;
  }
}
