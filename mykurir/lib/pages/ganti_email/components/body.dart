import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/controllers/auth_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    final AuthController _authController = Get.put(AuthController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xffE31E24),
                  size: 25,
                ),

                style: IconButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ganti Email",
                    style: GoogleFonts.poppins(
                      color: Color(0xffE31E24),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Silahkan masukan anda yang baru",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, bottom: 5, left: 13),
            child: Text(
              "Email baru",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff5A5A5A), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 46),
            child: ElevatedButton(
              onPressed: () {
                _authController.isLoading.value = true;
                _authController.requestChangeEmail(
                  _emailController.text.trim(),
                );
                Get.toNamed(
                  "/verif_otp",
                  arguments: {
                    "email": _emailController.text.trim(),
                    "type": "changeEmail",
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(6)),
                ),
                backgroundColor: Color(0xffE31E24),
                padding: EdgeInsets.symmetric(vertical: 10),
                minimumSize: Size(MediaQuery.sizeOf(context).width, 0),
              ),
              child: Text(
                "Selesai",
                style: GoogleFonts.poppins(
                  color: Color(0xffFEFEFE),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
