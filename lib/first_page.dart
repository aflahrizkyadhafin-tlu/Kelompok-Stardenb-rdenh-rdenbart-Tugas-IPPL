import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/loading_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> pages = [
      {"title": "Auth Testing", "path": "/authtesting"},
      {"title": "Testing Photo", "path": "/testingphoto"},
      {"title": "Testing Profile", "path": "/testingprofile"},
      {"title": "Testing FAQ", "path": "/testingFAQ"},
      {"title": "Testing Laporan", "path": "/testinglaporan"},
    ];
    Get.lazyPut(() => LoadingController());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              for (Map data in pages)
                Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          data["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(data["path"]),
                          child: Text(data["title"]), // Nama tombol diperbaiki
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
