import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_tracking/services/firebase_crud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../utility/theme.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetail extends StatelessWidget {
  var id;
  var collectionReference;
  NewsDetail(String id, {Key? key}) : super(key: key){
    this.id = id;
    final Stream<QuerySnapshot> data = FirebaseCrud.getNewsById(id);
    this.collectionReference = data;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreen800o9,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Blog",
              style: GoogleFonts.pangolin(
                  color: kWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp
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
                  return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(e["id"])));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                              child: Image.network(
                                e["image"],
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  e["title"],
                                  style: GoogleFonts.pangolin(
                                      color: kGreen800o9,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp
                                  ),
                                ),
                                subtitle: Html(data: e["content"]),
                              ),
                            ),
                          ],
                        ),
                      )
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
    );
  }

}

