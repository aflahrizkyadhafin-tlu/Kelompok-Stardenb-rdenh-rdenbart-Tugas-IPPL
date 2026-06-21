import 'package:flutter/material.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/routes.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Connection connection = Get.put(Connection());
  connection.connectDB();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(getPages: routes);
  }
}
