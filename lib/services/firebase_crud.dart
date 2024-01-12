import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseStorage _storage = FirebaseStorage.instanceFor(bucket: "gs://health-tracking-v2.appspot.com");
final CollectionReference _Collection = _firestore.collection('news');
class FirebaseCrud {
//CRUD method here
  static Stream<QuerySnapshot> readNews() {
    CollectionReference newsItemCollection = _Collection;
    Stream<QuerySnapshot> stream = newsItemCollection.where("status", isEqualTo: 1).snapshots();
    return stream;
  }
  static Stream<QuerySnapshot> getNewsById(id) {
    CollectionReference newsItemCollection = _Collection;
    Stream<QuerySnapshot> stream = newsItemCollection.where("status", isEqualTo: 1).where("id", isEqualTo: id).snapshots();
    return stream;
  }

  static Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  static Future<Response> addNews({
    required String title,
    required String content,
    required Uint8List file
  }) async {
    String imageUrl = await uploadImageToStorage("image", file);
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "content": content,
      "image": imageUrl,
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