import 'package:codehack_coders_curriculum/controller/auth_provider.dart';
import 'package:codehack_coders_curriculum/controller/main_provider.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthProvider>(AuthProvider());
    Get.put<MainProvider>(MainProvider());

  }
}