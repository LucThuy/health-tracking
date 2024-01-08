import 'package:flutter/material.dart';
import 'package:health_tracking/features/blog/blog_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../utility/theme.dart';
import '../../services/firebase_crud.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPage();
  }
}

class _AddPage extends State<AddPage> {
  final _title = TextEditingController();
  final _content = TextEditingController();
  final _image = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
        controller: _title,
        autofocus: false,
        cursorColor: kGreen800,
        style: GoogleFonts.pangolin(
          color: kGreen800,
          fontWeight: FontWeight.w300,
          fontSize: 12.sp,
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
                top: 20, bottom: 15, left: 20, right: 20),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: GoogleFonts.pangolin(
              color: kGreen800,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
            labelStyle: GoogleFonts.pangolin(
              color: kGreen800,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
            fillColor: kWhite,
            filled: true,
            labelText: "Title",
            hintText: "Nhập tiêu đề",
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kGreen800),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: kGreen800, width: 2),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: kGreen800),
                borderRadius: BorderRadius.circular(10))
        )
    );
    final positionField = TextFormField(
        controller: _content,
        autofocus: false,
        cursorColor: kGreen800,
        style: GoogleFonts.pangolin(
          color: kGreen800,
          fontWeight: FontWeight.w300,
          fontSize: 12.sp,
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
                top: 80, bottom: 40, left: 20, right: 20),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: GoogleFonts.pangolin(
              color: kGreen800,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
            labelStyle: GoogleFonts.pangolin(
              color: kGreen800,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
            fillColor: kWhite,
            filled: true,
            labelText: "Content",
            hintText: "Nhập nội dung",
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kGreen800),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: kGreen800, width: 2),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: kGreen800),
                borderRadius: BorderRadius.circular(10))
        )
    );
    final contactField = TextFormField(
        controller: _image,
        autofocus: false,
        cursorColor: kGreen800,
        style: GoogleFonts.pangolin(
          color: kGreen800,
          fontWeight: FontWeight.w300,
          fontSize: 12.sp,
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
                top: 20, bottom: 15, left: 20, right: 20),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: GoogleFonts.pangolin(
              color: kGreen800,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
            labelStyle: GoogleFonts.pangolin(
              color: kGreen800,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
            fillColor: kWhite,
            filled: true,
            labelText: "Image Link",
            hintText: "https://image.vn.com",
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kGreen800),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: kGreen800, width: 2),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: kGreen800),
                borderRadius: BorderRadius.circular(10))
        )
    );

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: kGreen800o9,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.addNews(
                title: _title.text,
                content: _content.text,
                image: _image.text);
            if(response.code == 200) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlogPage())
              );
            }
            if (response.code != 200) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            }
          }
        },
        child: Text(
          "Save",
          style: GoogleFonts.pangolin(
              color: kWhite,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Health Blog',
          style: GoogleFonts.pangolin(
            color: kWhite,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp
        ),
        ),
        backgroundColor: kGreen800o9,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  nameField,
                  const SizedBox(height: 25.0),
                  positionField,
                  const SizedBox(height: 35.0),
                  contactField,
                  const SizedBox(height: 45.0),
                  SaveButon,
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}