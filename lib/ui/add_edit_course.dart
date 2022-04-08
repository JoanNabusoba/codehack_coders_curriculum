import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/btn.dart';
import 'widgets/textfield.dart';

class AddEditCourse extends StatefulWidget {
  const AddEditCourse({Key? key}) : super(key: key);

  @override
  _AddEditCourseState createState() => _AddEditCourseState();
}

class _AddEditCourseState extends State<AddEditCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add/Edit Course"),
        backgroundColor: Color.fromRGBO(108, 99, 255, 1),
      ),
      body: Container(
        width: Get.size.width,
        height: Get.size.height,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              TxtField(hintText: "Course title", inputType: TextInputType.text),
              SizedBox(height: 15),
              TxtField(
                  hintText: "Course category", inputType: TextInputType.text),
              SizedBox(height: 15),
              TxtField(hintText: "Description", inputType: TextInputType.text),
              SizedBox(height: 15),
              TxtField(hintText: "Course link", inputType: TextInputType.url),
              SizedBox(height: 25),
              Btn(
                  text: "Save details",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
