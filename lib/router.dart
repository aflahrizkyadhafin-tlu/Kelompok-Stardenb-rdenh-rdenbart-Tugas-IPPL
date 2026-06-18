import 'package:get/get.dart';
import 'package:setting_api/auth_testing.dart';
import 'package:setting_api/faq_testing.dart';
import 'package:setting_api/first_page.dart';
import 'package:setting_api/laporan_testing.dart';
import 'package:setting_api/photo_testing.dart';
import 'package:setting_api/profile_testing.dart';

List<GetPage<dynamic>> router = [
  GetPage(name: "/", page: () => FirstPage()),
  GetPage(name: "/authtesting", page: () => AuthTesting()),
  GetPage(name: "/testingphoto", page: () => PhotoTesting()),
  GetPage(name: "/testingprofile", page: () => ProfileTesting()),
  GetPage(name: "/testingFAQ", page: () => FaqTesting()),
  GetPage(name: "/testinglaporan", page: () => LaporanTesting()),
];
