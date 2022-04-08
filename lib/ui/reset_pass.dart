
import 'package:codehack_coders_curriculum/ui/view_courses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/btn.dart';
import 'widgets/textfield.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .09),
              Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/forgotpass2.png"))
                ),
              ),
              SizedBox(height: 18),
              Text("Reset Password",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(
                  )),
              SizedBox(height: 30),
              TxtField(hintText: "Enter new password", inputType: TextInputType.text,
                  obscureText: true),
              SizedBox(height: 16),
              TxtField(hintText: "Repeat new password", inputType: TextInputType.text,
                  obscureText: true),
              SizedBox(height: 16),
              Btn(text: "Save new password", onPressed: (){
                Get.to(() => ViewCourses());
              }),
              SizedBox(height: 25),

            ],
          ),
        ),
      ),
    );
  }
}
