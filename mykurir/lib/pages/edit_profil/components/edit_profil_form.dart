import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/controllers/akun_controller.dart';

class EditProfilForm extends StatelessWidget {
  const EditProfilForm({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;

    final AkunController akunController = Get.put(AkunController());

    TextEditingController textController = TextEditingController(
      text: args["value"],
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      "Batal",
                      style: GoogleFonts.poppins(
                        color: Color(0xff2E2E2E),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      if (args["type"] == "Username")
                        akunController.profileAkun.value!.username =
                            textController.text.trim(),
                      if (args["type"] == "Nama Pengguna")
                        akunController.profileAkun.value!.namaLengkap =
                            textController.text.trim(),
                      if (args["type"] == "Alamat")
                        akunController.profileAkun.value!.alamat =
                            textController.text.trim(),
                      akunController.profileAkun.refresh(),
                      Get.back(),
                    },
                    child: Text(
                      "Simpan",
                      style: GoogleFonts.poppins(
                        color: Color(0xffE31E24),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                args["type"],
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Color(0xff9E1217),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Silahkan isi ${args["type"].toString().toLowerCase()} anda yang baru",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff2E2E2E),
                ),
              ),
              SizedBox(height: 25),
              TextField(
                controller: textController,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  fillColor: Color(0xffDFDFDF),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
