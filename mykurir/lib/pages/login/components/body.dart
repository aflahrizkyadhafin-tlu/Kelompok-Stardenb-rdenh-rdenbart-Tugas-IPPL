import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isObscure = true.obs;

    // final LoadingController loadingController = Get.find();
    final AuthController authController = Get.find();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 40),
                const Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9E1217),
                  ),
                ),
                const Text(
                  'Silahkan masuk ke akun',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),

                const SizedBox(height: 30),
                //Logo
                Center(
                  child: Image.asset(
                    "assets/icons/icon-app.png",
                    fit: BoxFit.fill,
                    width: 120,
                  ),
                ),

                const SizedBox(height: 30),

                _inputLabel(Icons.person_outline, 'Nama Pengguna / Email'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  decoration: _inputDecoration(),
                ),

                const SizedBox(height: 20),

                _inputLabel(Icons.lock_outline, 'Password'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: passwordController,
                  obscureText: isObscure.value,
                  decoration: _inputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        isObscure.value = !isObscure.value;
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed("/lupa_password");
                    },
                    child: Text(
                      'Lupa Password?',
                      style: GoogleFonts.inter(
                        color: Color(0xFFE31E24),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                //Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      authController.isLoading.value = true;
                      authController
                          .login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          )
                          .then(
                            (e) => {
                              if (authController.detailUser.value != null)
                                {
                                  Get.snackbar(
                                    "Login berhasil",
                                    "Email : ${authController.detailUser.value!.email}",
                                  ),
                                  Get.toNamed("/beranda"),
                                },
                            },
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE31E24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                //Buat Akun Button
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Belum memiliki akun?',
                        style: TextStyle(color: Colors.black54),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/daftar");
                        },
                        child: const Text(
                          'Buat Akun',
                          style: TextStyle(
                            color: Color(0xFFE31E24),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputLabel(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black87),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  InputDecoration _inputDecoration({Widget? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
