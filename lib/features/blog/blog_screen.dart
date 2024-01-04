import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_tracking/features/authenticate/login_page.dart';
import 'package:health_tracking/features/blog/add_news_modal.dart';
import 'package:health_tracking/services/firebase_crud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<BlogPage> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readNews();
  String? email = FirebaseAuth.instance.currentUser?.email;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Blog",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView(
                children: snapshot.data!.docs.map((e) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(e["title"]),
                        ),
                        Image.network(
                        e["image"], width: 200, height: 100,)
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          } else {
            // Handle the case where snapshot does not have data
            // You might want to return a loading indicator or an empty container
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(email != null) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPage())
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage())
            );
          }

        },
        child: const Icon(Icons.add),
      ),
    );
  }

}

