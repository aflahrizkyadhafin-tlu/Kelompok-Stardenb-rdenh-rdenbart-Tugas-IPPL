import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/controllers/rating_aplikasi_controller.dart';
import 'package:mykurir/models/rating_aplikasi.dart';

class Body extends StatelessWidget {
  final int selectedRating;
  final ValueChanged<int> onRatingChanged;
  final TextEditingController feedbackController;

  const Body({
    super.key,
    required this.selectedRating,
    required this.onRatingChanged,
    required this.feedbackController,
  });

  @override
  Widget build(BuildContext context) {
    final LoadingController loadingController = Get.put(LoadingController());
    final RatingAplikasiController ratingAplikasiController = Get.put(
      RatingAplikasiController(),
    );
    final AkunController akunController = Get.put(AkunController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header ---
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 24.0,
                bottom: 12.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Rating Aplikasi',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),

            // --- Garis Pembatas ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                height: 2,
                thickness: 1.5,
                color: Color(0xB2000000),
              ),
            ),

            // --- Konten Utama ---
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // --- Ikon Smiley ---
                      Image.asset(
                        'assets/icons/emojismile.png',
                        width: 90,
                        height: 90,
                        fit: BoxFit.contain,
                        color: Color(0xFF2E2E2E),
                      ),
                      const SizedBox(height: 32),

                      // --- Judul ---
                      Text(
                        'Bagaimana Pengalaman Anda?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Penilaian anda sangat membantu kami untuk mengembangkan aplikasi ini menjadi lebih baik',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF5A5A5A),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 36),

                      // --- Bintang Rating ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          final isSelected = index < selectedRating;
                          return GestureDetector(
                            onTap: () => onRatingChanged(index + 1),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              child: Image.asset(
                                'assets/icons/Vector.png',
                                width: 46,
                                height: 46,
                                color: isSelected
                                    ? const Color(0xFFFFC107)
                                    : const Color(0xFFE5E5E5),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 36),

                      // --- Label Textarea ---
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Apa yang bisa kami tingkatkan?',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // --- Textarea ---
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFFCCCCCC),
                            width: 1.2,
                          ),
                        ),
                        child: TextField(
                          controller: feedbackController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(16),
                            hintText: 'Tulis saran atau masukan Anda...',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 13,
                              color: const Color(0xFF999999),
                            ),
                          ),
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // --- Tombol Kirim ---
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            loadingController.show();
                            ratingAplikasiController
                                .tambahRatingAplikasi(
                                  RatingAplikasi(
                                    pesan: feedbackController.text.trim(),
                                    skor: double.parse(
                                      selectedRating.toString(),
                                    ),
                                    idAkun: akunController
                                        .profileAkun
                                        .value!
                                        .idAkun,
                                  ),
                                )
                                .then(
                                  (e) => Get.toNamed("/terima_kasih_penilaian"),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE31E24),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Kirim',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
