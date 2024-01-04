import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('news');
class FirebaseCrud {
//CRUD method here
  static Stream<QuerySnapshot> readNews() {
    CollectionReference newsItemCollection = _Collection;
    Stream<QuerySnapshot> stream = newsItemCollection.where("status", isEqualTo: 1).snapshots();
    return stream;
  }

  static Future<Response> addNews({
    required String title,
    required String content,
    required String image,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "content": content,
      "image" : image,
      "status": 0
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added news";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}