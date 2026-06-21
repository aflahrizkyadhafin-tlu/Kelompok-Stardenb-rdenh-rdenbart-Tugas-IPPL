import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/pages/ganti_password/components/password_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController currentPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    final AuthController authController = Get.put(AuthController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 22,
                      color: Color(0xffE31E24),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Ganti Password Baru",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffE31E24),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 5),
                child: Text(
                  "Silahkan isi data ini",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2E2E2E),
                  ),
                ),
              ),
              SizedBox(height: 50),
              PasswordForm(
                title: "Password saat ini",
                controller: currentPassword,
              ),
              SizedBox(height: 15),
              PasswordForm(title: "Password baru", controller: newPassword),
              SizedBox(height: 15),
              PasswordForm(
                title: "Konfirmasi password baru",
                controller: confirmPassword,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  bool isValid =
                      newPassword.text.trim() == confirmPassword.text.trim();

                  if (isValid) {
                    authController.changePassword(newPassword.text.trim());
                  }
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffE31E24),
                  minimumSize: Size(MediaQuery.sizeOf(context).width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                  ),
                ),
                child: Text(
                  "Selesai",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
