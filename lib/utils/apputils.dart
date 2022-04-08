import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AppUtils {
  // static showMsg(msg,color){
  //   SmartDialog.show(
  //     alignmentTemp: Alignment.bottomCenter,
  //     clickBgDismissTemp: true,
  //     widget: Container(
  //       color: color,
  //       width: Get.width,
  //       margin: const EdgeInsets.symmetric(horizontal: 20),
  //       child:Text(msg, style: const TextStyle(
  //         color: Colors.white
  //       ),)
  //     ),
  //   );
  //
  //
  //
  // }
  static showMsg(title, msg, color, icon) {
    Get.snackbar("$title", '$msg',
        borderRadius: 0,
        snackPosition: SnackPosition.BOTTOM,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(0),
        duration: const Duration(seconds: 3),
        backgroundColor: color[300],
        leftBarIndicatorColor: color[700],
        colorText: Colors.white);
  }

  static showLoading() {
    SmartDialog.show(
      alignmentTemp: Alignment.center,
      clickBgDismissTemp: true,
      isLoadingTemp: true,
      maskColorTemp: Color.fromRGBO(8, 171, 171, 1).withOpacity(0.9),
      widget: Container(
          color: Colors.transparent,
          width: 300,
          alignment: AlignmentDirectional.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 300,
          child: Column(
            children: const [
              SpinKitDoubleBounce(
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "LOADING",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ],
          )),
    );
  }

  static showSuccess(msg) {
    showMsg("Success!", msg, Colors.green, Icons.check_circle_sharp);
  }

  static showInfo(msg) {
    showMsg("Info!", msg, Colors.blue, Icons.info);
  }

  static showError(msg) {
    showMsg("Error!", msg, Colors.red, Icons.error_outlined);
  }

  static showWarning(msg) {
    showMsg("Warning!", msg, Colors.orange, Icons.warning);
  }
}
