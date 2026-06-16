import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/router.dart';

void main() {
  Connection connection = Get.put(Connection());
  WidgetsFlutterBinding.ensureInitialized;
  connection.connectDB();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(getPages: router);
  }
}
