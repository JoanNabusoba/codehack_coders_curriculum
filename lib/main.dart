import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'controller/main_binding.dart';
import 'ui/login.dart';

Future<void> main() async {

  //--setting up parse initially at the main
  //init widget binding for platform bridge
  WidgetsFlutterBinding.ensureInitialized();

  var keyParseApplicationId = "MYJEqo74nyeCNRSdRqzLp0U62PFig6z2i1a30RNd";
  var keyParseServerUrl = "https://parseapi.back4app.com";
  var keyParseClientKey = "vt3IFFj3qOfPwrEPcILG8HpMVcymK9KGNfZeMGlv";
  var store = await CoreStoreSembastImp.getInstance(password: "Pwani");
  await Parse().initialize(
      keyParseApplicationId,
      keyParseServerUrl,
      clientKey: keyParseClientKey,
      autoSendSessionId: true,
      coreStore: store);
  //--

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBinding(),
      title: 'Pwani Teknowgalz Courses',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      //init smart dialog to popup and to close fro anywhere
      builder: (BuildContext context, Widget? child){
        return FlutterSmartDialog(child: child);
      },
    );
  }
}
