import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordForm extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const PasswordForm({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    RxBool _showPassword = false.obs;

    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Obx(
            () => TextField(
              controller: controller,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              obscureText: !_showPassword.value,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () => _showPassword.value = !_showPassword.value,
                  child: !_showPassword.value
                      ? Icon(Icons.lock_outlined)
                      : Icon(Icons.lock_open_outlined),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xffE31E24)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xff5A5A5A)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
