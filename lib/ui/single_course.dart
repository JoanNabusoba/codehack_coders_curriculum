import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_edit_course.dart';
import 'widgets/btn.dart';

class SingleCourse extends StatefulWidget {
  const SingleCourse({Key? key}) : super(key: key);

  @override
  _SingleCourseState createState() => _SingleCourseState();
}

class _SingleCourseState extends State<SingleCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(108, 99, 255, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              foregroundDecoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('images/course.png'))),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16),
                  Text("Coders at American Spaces Kenya",
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 6),
                  Text("Coding in web and mobile",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: Colors.black45)),
                  SizedBox(height: 30),
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.black87,
                          letterSpacing: .8,
                          height: 1.2)),
                  SizedBox(height: 35),
                  Btn(text: "Enroll Course", onPressed: () {}),
                  SizedBox(height: 25),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddEditCourse());
          },
          backgroundColor: Color.fromRGBO(230, 88, 62, 1),
          child: Icon(
            Icons.edit,
            color: Colors.white,
          )),
    );
  }
}
