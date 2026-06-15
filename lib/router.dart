import 'package:get/get.dart';
import 'package:setting_api/auth_testing.dart';
import 'package:setting_api/photo_testing.dart';

List<GetPage<dynamic>> router = [
  GetPage(name: "/", page: () => AuthTesting()),
  GetPage(name: "/testingphoto", page: () => PhotoTesting()),
];
