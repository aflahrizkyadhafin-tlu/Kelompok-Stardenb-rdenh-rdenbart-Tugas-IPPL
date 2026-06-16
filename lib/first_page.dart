import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/loading_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoadingController());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // ================================
              // Auth
              // ================================
              Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "Auth",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => Get.toNamed("/authtesting"),
                        child: const Text("Auth"), // Nama tombol diperbaiki
                      ),
                    ],
                  ),
                ),
              ),

              // ================================
              // Testing Photo
              // ================================
              Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "Testing Photo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => Get.toNamed("/testingphoto"),
                        child: const Text(
                          "Testing Photo",
                        ), // Nama tombol diperbaiki
                      ),
                    ],
                  ),
                ),
              ),

              // ================================
              // Profile Testing
              // ================================
              Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "Testing profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => Get.toNamed("/testingprofile"),
                        child: const Text(
                          "Testing profile",
                        ), // Nama tombol diperbaiki
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
