import 'package:codehack_coders_curriculum/controller/auth_provider.dart';
import 'package:codehack_coders_curriculum/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'reset_pass.dart';
import 'widgets/btn.dart';
import 'widgets/textfield.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  //add controller
  TextEditingController emailController = TextEditingController();

  //dispose controller
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
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
                    image: DecorationImage(
                        image: AssetImage("images/forgotpass2.png"))),
              ),
              SizedBox(height: 18),
              //add controller to the textfields
              Text("Forgot Password",
                  style: Theme.of(context).textTheme.headline5!.copyWith()),
              SizedBox(height: 30),
              TxtField(
                  hintText: "Enter your email",
                  inputType: TextInputType.emailAddress,
                  obscureText: false, textEditingController: emailController,),
              SizedBox(height: 16),
              Btn(
                  text: "Reset password",
                  onPressed: () async {
                    var isResetPass = await AuthProvider.to.forgotPass(email: emailController.text);
                    if(isResetPass){
                      Get.to(() => Login());
                    }
                  }),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
