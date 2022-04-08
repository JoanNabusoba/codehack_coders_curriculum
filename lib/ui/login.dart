import 'package:codehack_coders_curriculum/controller/auth_provider.dart';
import 'package:codehack_coders_curriculum/ui/forgot_pass.dart';
import 'package:codehack_coders_curriculum/ui/signup.dart';
import 'package:codehack_coders_curriculum/ui/view_courses.dart';
import 'package:codehack_coders_curriculum/ui/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                        image: AssetImage("images/login2.png"))),
              ),
              SizedBox(height: 18),
              Text("Login",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              SizedBox(height: 30),
              TxtField(
                  hintText: "Email",
                  inputType: TextInputType.emailAddress,
                  obscureText: false, textEditingController: emailController,),
              SizedBox(height: 16),
              TxtField(
                  hintText: "Password",
                  inputType: TextInputType.text,
                  obscureText: true, textEditingController: passwordController,),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(() => ForgotPass());
                      },
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(247, 153, 46, 1)))),
                ],
              ),
              SizedBox(height: 10),
              Btn(
                  text: "Login",
                  onPressed: () async {
                    var isLoggedIn = await AuthProvider.to.loginUser(email: emailController.text,
                    password: passwordController.text);
                    if(isLoggedIn){
                      Get.to(() => ViewCourses());
                    }

                  }),
              SizedBox(height: 25),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.to(() => Signup());
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "Don\'t have an account?",
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign up',
                              style: TextStyle(
                                  color: Color.fromRGBO(230, 88, 62, 1),
                                  fontSize: 16))
                        ]),
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
