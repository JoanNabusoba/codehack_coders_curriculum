import 'package:codehack_coders_curriculum/ui/login.dart';
import 'package:codehack_coders_curriculum/utils/apputils.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class AuthProvider extends GetxController {
  //create a map that will hold the user
  var userDets = {}.obs;
  //parse user
  var parseUser = {}.obs;

  ///// You do not need that. I recommend using it just for ease of syntax.
  //   /// with static method: Controller.to.increment();
  //   /// with no static method: Get.find<Controller>().increment();
  //   /// There is no difference in performance, nor any side effect of using
  //   ///either syntax. Only one does not need the type, and the other the IDE will autocomplete it.
  static AuthProvider get to => Get.find();

  //When this controller is init, always check when the user has changed
  @override
  onReady() {
    ever(parseUser, userHandler);
  }

  //---method to sign up user
  signUpUser({username, password, emailAddress, usertype}) async {
    //show loader
    AppUtils.showLoading();

    // use validate if empty method created to validate user inputs
    if (validateIfEmpty("username", username) ||
        validateIfEmpty("password", password) ||
        validateIfEmpty("email", emailAddress) ||
        validateIfEmpty("usertype", usertype)) {
      //dismiss dialog
      SmartDialog.dismiss();
      // the function stops here, won't go down to create the user
      return false;
    }
    //create a user using ParseUser, add ..set to add extra fields
    var user = ParseUser(emailAddress, password, emailAddress)
      ..set('usertype', usertype)
      ..set("fullnames", username);

    var response = await user.signUp();
    //successful signup
    try {
      if (response.success) {
        //get current logged in user
        await getParseUser();
        //stop loader
        AppUtils.showSuccess("Success!");
        //dismissing the loader
        SmartDialog.dismiss();
        return true;
      }
    } catch (e) {
      AppUtils.showError("An error occurred, please try again later");
      print(e.toString());
      //dismissing the loader
      SmartDialog.dismiss();
    }
    return false;
  }
  //---end of method to sign up user

  //---method to login user
  loginUser({email, password}) async {
    //show loader
    AppUtils.showLoading();
    // use validate if empty method created to validate user inputs
    if (validateIfEmpty("email", email) ||
        validateIfEmpty("password", password)) {
      //dismiss dialog
      SmartDialog.dismiss();
      // the function stops here, won't go down to create the user
      return false;
    }
    //print("email:$email & password:$password");
    try {
      var user = ParseUser(email, password, email);
      var response = await user.login();

      //success login

      if (response.success) {
        //get current logged in user
        await getParseUser();
        //stop loader
        AppUtils.showSuccess("Login successful!");
        //dismissing the loader
        SmartDialog.dismiss();
        return true;
      }
      //Check whether the response is an error
      else {
        //print(response.error);
        AppUtils.showError(response.error?.message);
        SmartDialog.dismiss();
        return false;
      }
    } catch (e) {
      SmartDialog.dismiss();
      AppUtils.showError("An error occurred, please try again later");
      print(e.toString());
    }

    return false;
  }
  //---end of method to login user

  //---forgot password
  forgotPass({email}) async {
    //show loader
    AppUtils.showLoading();
    // use validate if empty method created to validate user inputs
    if (validateIfEmpty("email", email)) {
      //dismiss dialog
      SmartDialog.dismiss();
      // the function stops here, won't go down to create the user
      return false;
    }

    //creating user object
    try {
      var user = ParseUser(email, "", email);
      var response = await user.requestPasswordReset();
      if (response.success) {
        AppUtils.showSuccess("Password reset! Check your email");
        SmartDialog.dismiss();
        return true;
      }
    } catch (e) {
      AppUtils.showError("An error occurred, please try again later");
      SmartDialog.dismiss();
      print(e.toString());
    }
    return false;
  }
  //---end of forgot password

  ////function to get parse user
  getParseUser() async {
    var user = await ParseUser.currentUser();
    parseUser.value.assignAll((user as ParseUser).toJson());
  }

  ////Logout
  logoutUser() async {
    //get the user from parse user from parseUser
    await getParseUser();
    //logout if user in empty
    if (parseUser.isNotEmpty) {
      var user = await ParseUser.currentUser();
      await (user as ParseUser).logout();
      parseUser.value.clear();
      update();
    }
  }

  ////Whenever the user is empty, go to login screen
  userHandler(user) {
    if (user.isEmpty) {
      //removes all screen
      Get.offAll(() => Login());
    }
  }

  //----validate if empty
  bool validateIfEmpty(fieldName, field) {
    if (field.toString().isEmpty) {
      AppUtils.showError("Field $fieldName should not be empty");
      return true;
    }
    return false;
  }
}
