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
              // kurirController.perbaruiLokasi(
              //   "a0923d8e-fdbe-4a1d-8b04-013cbef08199",
              //   -7.419011,
              //   109.222540,
              // );
              kurirController.terimaPesanan(
                "deabffee-55d1-4d1f-816d-60e4321f3388",
                "a0923d8e-fdbe-4a1d-8b04-013cbef08199",
              );
            },
            child: Text("Testing update status"),
          ),
        ),
      ),
    );
  }
}
