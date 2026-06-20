import 'package:get/get.dart';
import 'package:mykurir/beranda_sementara.dart';
import 'package:mykurir/pages/daftar/daftar_screen.dart';
import 'package:mykurir/pages/daftar_mitra_driver_1/mitra_driver_1_screen.dart';
import 'package:mykurir/pages/daftar_mitra_driver_2/mitra_driver_2_screen.dart';
import 'package:mykurir/pages/daftar_mitra_driver_3/mitra_driver_3_screen.dart';
import 'package:mykurir/pages/daftar_mitra_driver_4/mitra_driver_4_screen.dart';
import 'package:mykurir/pages/daftar_mitra_driver_5/mitra_driver_5_screen.dart';
import 'package:mykurir/pages/detail_pesanan_on_deliv/detail_pesanan_on_deliv_screen.dart';
import 'package:mykurir/pages/detail_pesanan_selesai/detail_pesanan_selesai_screen.dart';
import 'package:mykurir/pages/edit_profil/edit_profil_screen.dart';
import 'package:mykurir/pages/login/login_screen.dart';
import 'package:mykurir/pages/masuk_no_HP/masuk_no_HP_screen.dart';
import 'package:mykurir/pages/permintaan_pesanan/permintaan_pesanan_screen.dart';
import 'package:mykurir/pages/pilih_role/pilihrole_screen.dart';
import 'package:mykurir/pages/profil/profil_screen.dart';
import 'package:mykurir/pages/rating_aplikasi/rating_aplikasi_screen.dart';
import 'package:mykurir/pages/rating_driver/rating_driver_screen.dart';
import 'package:mykurir/pages/setting/setting_screen.dart';
import 'package:mykurir/pages/verif_otp/verif_otp_screen.dart';
import 'package:mykurir/pages/terima_kasih_penilaian/terima_kasih_penilaian_screen.dart';

List<GetPage<dynamic>> routes = [
  // Login Sementara
  GetPage(name: "/beranda_sementara", page: () => BerandaSementara()),

  // Route Login
  GetPage(name: "/", page: () => LoginScreen()),

  // Route Daftar
  GetPage(name: "/daftar", page: () => DaftarScreen()),

  // Route Verifikasi OTP
  GetPage(name: "/masukan_no_hp", page: () => MasukNoHPScreen()),
  GetPage(name: "/verif_otp", page: () => VerifOtpScreen()),

  // Route Pesanan
  GetPage(name: "/permintaan_pesanan", page: () => PermintaanPesananScreen()),
  GetPage(
    name: "/detail_pesanan_on_deliv",
    page: () => DetailPesananOnDelivScreen(),
  ),
  GetPage(
    name: "/detail_pesanan_selesai",
    page: () => DetailPesananSelesaiScreen(),
  ),

  // Route Setting
  GetPage(name: "/setting", page: () => SettingScreen()),

  // Route Pilih Role
  GetPage(name: "/pilih_role", page: () => PilihroleScreen()),

  // Route Rating
  GetPage(name: "/rating_driver", page: () => RatingDriverScreen()),
  GetPage(name: "/rating_aplikasi", page: () => RatingAplikasiScreen()),
  GetPage(
    name: "/terima_kasih_penilaian",
    page: () => TerimakasihPenilaianScreen(),
  ),

  // Route Profil
  GetPage(name: "/profil", page: () => ProfilScreen()),
  GetPage(name: "/edit_profil", page: () => EditprofilScreen()),

  // Route Daftar Mitra
  GetPage(name: "/daftar_mitra_driver_1", page: () => MitraDriver1Screen()),
  GetPage(name: "/daftar_mitra_driver_2", page: () => MitraDriver2Screen()),
  GetPage(name: "/daftar_mitra_driver_3", page: () => MitraDriver3Screen()),
  GetPage(name: "/daftar_mitra_driver_4", page: () => MitraDriver4Screen()),
  GetPage(name: "/daftar_mitra_driver_5", page: () => MitraDriver5Screen()),
];
