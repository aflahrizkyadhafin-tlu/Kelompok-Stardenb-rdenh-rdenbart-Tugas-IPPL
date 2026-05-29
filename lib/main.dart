import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/controllers/kurir_controller.dart';
import 'package:setting_api/controllers/log_pengiriman_controller.dart';
import 'package:setting_api/controllers/pengiriman_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  Connection.connectDB();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    KurirController controller = Get.put(KurirController());

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              controller.batalkanPesanan(
                "deabffee-55d1-4d1f-816d-60e4321f3388",
              );
            },
            child: Text("Testing update status"),
          ),
        ),
      ),
    );
  }
}
