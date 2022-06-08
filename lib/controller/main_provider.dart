import 'package:codehack_coders_curriculum/utils/apputils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class MainProvider extends GetxController {
  //as lists
  var coursesLists = [].obs;
  //as maps
  var selectedCourse = {}.obs;

  //---method to fetch courses list from parse server
  fetchCourseLists() async {
    //show loader
    AppUtils.showLoading();
    //fetch all course lists
    var apiResponse = await ParseObject('Courses').getAll();

    if (apiResponse.success) {
      //clear courses list
      coursesLists.clear();
      update();

      var results = apiResponse.results ?? [];
      //after fetching
      for (var obj in results) {
        //cast parse object
        //toJSon brings data as Map
        coursesLists.add((obj as ParseObject).toJson());
      }
      AppUtils.showSuccess("Courses downloaded successfully");
      //dismissing the loader
      SmartDialog.dismiss();
    }
  }
  //---end method to fetch parse lists

  //--method to set single course from list
  //has a parameter course as a map
  setSelectedCourse(course) {
    //check whether the selectedCourse has value/data
    if (course == null) {
      //clear to indicate that you are creating a new course
      //it makes the selectedCourse empty, sought of a flag
      selectedCourse.value.clear();
      update();
    } else {
      //replace all content of the selected value with course
      //called when updating or viewing course
      //gets a single course ID and adds to the map
      selectedCourse.value.addAll(course);
      update();
    }
  }
  //-- end method to set single course from list

  //-- method to add or edit course
  addOrEditCourse({title, subtitle, content, enrolled}) async {
    AppUtils.showLoading();
    try {
      if (selectedCourse.isEmpty) {
        //it means you are creating. Refer to the flag we made in selected course method
        var course = ParseObject('Courses')
          ..set('title', title)
          ..set('subtitle', subtitle)
          ..set('content', content)
          ..set('enrolled', enrolled);
        await course.save();
        AppUtils.showSuccess("Course created successfully");
      } else {
        //means we are updating existing data
        var course = ParseObject('Courses')
          ..objectId = selectedCourse.value["objectId"]
          ..set('title', title)
          ..set('subtitle', subtitle)
          ..set('content', content)
          ..set('enrolled', enrolled);
        await course.save();
        AppUtils.showSuccess("Course updated successfully");
      }
    } catch (e) {
      AppUtils.showError("An error occurred, please try again later");
      print(e.toString());
    }
    SmartDialog.dismiss();
  }
  //-- end method to add or edit course

}
