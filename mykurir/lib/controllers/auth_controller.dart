import 'package:get/get.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/akun.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  LoadingController loadingController = Get.put(LoadingController());
  AkunController akunController = Get.put(AkunController());

  Rxn<Akun> detailUser = Rxn<Akun>();
  String sendEmail = "";
  String sendNomorTelepon = "";
  String sendUsername = "";

  Future<void> register(String email, String password) async {
    try {
      await db.auth.signUp(password: password, email: email);
      print("[Register] : Kode OTP berhasil dikirim");
      Get.snackbar("Register", "Kode OTP berhasil dikirim");
    } catch (e) {
      print("[Register] #Error: $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<bool> verifOTPEmail(String kodeOTP) async {
    try {
      final response = await db.auth.verifyOTP(
        type: OtpType.email,
        email: sendEmail,
        token: kodeOTP,
      );
      print("[verifOTP] : $response");

      Get.snackbar("Kode OTP", "Kode OTP berhasil diverifikasi");

      Akun sendData = Akun(idUser: response.user!.id, username: sendUsername);
      akunController.createProfile(sendData);

      return true;
    } catch (e) {
      print("[verifOTP] #Error : $e");
      return false;
    } finally {
      loadingController.hide();
    }
  }

  Future<void> gantiNomorTelepon(String nomorTelepon) async {
    try {
      await db.auth.updateUser(UserAttributes(phone: nomorTelepon));
      print("[gantiNomorTelepon] : Kode OTP berhasil dikirim");
    } catch (e) {
      print("[gantiNomorTelepon] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<bool> verifOTPTelepon(String nomorTelepon, String kodeOTP) async {
    print("Mencoba verifikasi nomor: [$nomorTelepon] dengan OTP: [$kodeOTP]");
    try {
      await db.auth.verifyOTP(
        type: OtpType.phoneChange,
        phone: nomorTelepon,
        token: kodeOTP,
      );
      print("[verifOTPTelepon] : Kode OTP berhasil diverifikasi");
      return true;
    } on AuthException catch (e) {
      if (e.message.contains("Invalid OTP") ||
          e.code == "bad_verification_code") {
        Get.snackbar(
          "OTP Salah",
          "Kode yang Anda masukkan tidak sesuai. Silakan periksa kembali.",
        );
      }
      return false;
    } catch (e) {
      print("[verifOTPTelepon] #Error : $e");
      return false;
    } finally {
      loadingController.hide();
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await db.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.user != null) {
        print("[Login] : ${response.user}");
        final akunUser = await db
            .from("akun")
            .select()
            .eq("id_user", response.user!.id)
            .maybeSingle();

        detailUser.value = Akun.fromJson(akunUser!);
      } else {
        print("[Login] : Akun tidak ditemukan");
      }
    } catch (e) {
      print("[Login] #error: $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<void> logout() async {
    try {
      await db.auth.signOut();
      print("[logout] : User telah logout");
      loadingController.hide();
    } catch (e) {
      print("[logout] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<void> getUser() async {
    try {
      final user = db.auth.currentUser;
      print("[cekUser] : $user");
    } catch (e) {
      print("[CekUser] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<void> sendOTPPassword(String email) async {
    try {
      await db.auth.resetPasswordForEmail(email);
      print("[sendOTPPassword] : Kode OTP dikirim");
    } catch (e) {
      print("[sendOTPPassword] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<void> changePassword(
    String otp,
    String newPassword,
    String email,
  ) async {
    try {
      await db.auth.verifyOTP(type: OtpType.recovery, email: email, token: otp);

      await db.auth.updateUser(UserAttributes(password: newPassword));
      print("[changePassword] : Password berhasil diubah");
    } catch (e) {
      print("[changePassword] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }
}
