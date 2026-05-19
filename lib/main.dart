import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/controllers/kurir_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  Connection.connectDB();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    KurirController kurirController = Get.put(KurirController());

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              kurirController.ubahStatus(
                "a0923d8e-fdbe-4a1d-8b04-013cbef08199",
                StatusKurir.available,
              );
            },
            child: Text("Testing update status"),
          ),
        ),
      ),
    );
  }
}
