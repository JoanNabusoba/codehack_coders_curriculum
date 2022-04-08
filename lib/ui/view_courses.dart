import 'package:codehack_coders_curriculum/ui/add_edit_course.dart';
import 'package:codehack_coders_curriculum/ui/profile.dart';
import 'package:codehack_coders_curriculum/ui/single_course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/textfield.dart';

class ViewCourses extends StatelessWidget {
  const ViewCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            //<Custom header that will scroll

            //you can use AppBar if you want a sticky appbar
            // >
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(108, 99, 255, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 42),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu_rounded,
                                color: Colors.white,
                              ))),
                      InkWell(
                        onTap: () {
                          Get.to(() => Profile());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20))),
                          padding: EdgeInsets.only(
                              top: 40, left: 16, right: 16, bottom: 12),
                          child: CircleAvatar(
                              backgroundImage: AssetImage('images/1intro.png')),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  //<Title

                  //Container is there to wrap and add padding
                  // >
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello, Aisha!",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white)),
                          SizedBox(height: 6),
                          Text("Available courses: 15",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: Colors.white70)),
                        ],
                      )),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: TxtField(
                        hintText: "Search course",
                        inputType: TextInputType.text,
                        obscureText: false),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),

            Column(
              children: [
                SizedBox(height: 20),
                ListTile(
                  leading: Container(
                    width: 60,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(8, 171, 171, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.menu_book_rounded,
                        color: Colors.white, size: 28),
                  ),
                  title: Text("Coders at American Spaces Kenya"),
                  subtitle: Text("Coding in web and mobile",
                      style: TextStyle(fontSize: 12)),
                  trailing: Icon(Icons.chevron_right_rounded),
                  onTap: () {
                    Get.to(() => SingleCourse());
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 60,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(8, 171, 171, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.menu_book_rounded,
                        color: Colors.white, size: 28),
                  ),
                  title: Text("Web development"),
                  subtitle:
                      Text("Coding in web", style: TextStyle(fontSize: 12)),
                  trailing: Icon(Icons.chevron_right_rounded),
                )
              ],
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddEditCourse());
          },
          backgroundColor: Color.fromRGBO(230, 88, 62, 1),
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
