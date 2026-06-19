import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/controllers/rating_aplikasi_controller.dart';
import 'package:mykurir/models/rating_aplikasi.dart';

class RatingBody extends StatelessWidget {
  // Parameter yang diterima dari widget parent
  final int selectedRating;
  final ValueChanged<int> onRatingChanged;
  final TextEditingController feedbackController;

  const RatingBody({
    super.key,
    required this.selectedRating,
    required this.onRatingChanged,
    required this.feedbackController,
  });

  @override
  Widget build(BuildContext context) {
    final LoadingController _loadingController = Get.put(LoadingController());
    final AuthController _authController = Get.put(AuthController());
    final RatingAplikasiController _ratingAplikasiController = Get.put(
      RatingAplikasiController(),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      body: SafeArea(
        child: Obx(
          () => _loadingController.getLoadingStatus().value
              ? Center(
                  child: CircularProgressIndicator(color: Color(0xffE31E24)),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Header ---
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFF2E2E2E),
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Rating Aplikasi',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2E2E2E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFDDDDDD)),

                    // --- Konten ---
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 32.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // --- Ikon Smiley Menggunakan PNG Assets ---
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF2E2E2E),
                                    width: 2.5,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/emojismile.png', // Pastikan file ada di assets
                                    width: 48,
                                    height: 48,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.sentiment_satisfied_alt_rounded,
                                        size: 48,
                                        color: Color(0xFF2E2E2E),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // --- Judul ---
                              Text(
                                'Bagimana Pengalaman Anda?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF2E2E2E),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Penilaian anda sangat membantu kami untuk mengembangkan aplikasi ini menjadi lebih baik',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF5A5A5A),
                                ),
                              ),
                              const SizedBox(height: 32),

                              // --- Bintang Rating ---
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(5, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Memanggil callback saat bintang ditekan
                                      onRatingChanged(index + 1);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0,
                                      ),
                                      child: Icon(
                                        index < selectedRating
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        size: 48,
                                        color: index < selectedRating
                                            ? const Color(0xFFFFC107)
                                            : const Color(0xFFCCCCCC),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(height: 32),

                              // --- Label Textarea ---
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Apa yang bisa kami tingkatkan?',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF2E2E2E),
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
                                  ),
                                ),
                                child: TextField(
                                  controller:
                                      feedbackController, // Menggunakan parameter dari konstruktor
                                  maxLines: 6,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(16),
                                    hintText:
                                        'Tulis saran atau masukan Anda...',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                              ),
                              const SizedBox(height: 32),

                              // --- Tombol Kirim ---
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _loadingController.show();
                                    _ratingAplikasiController
                                        .tambahRatingAplikasi(
                                          RatingAplikasi(
                                            pesan: feedbackController.text
                                                .trim(),
                                            skor: double.parse(
                                              selectedRating.toString(),
                                            ),
                                            idAkun: _authController
                                                .detailUser
                                                .value!
                                                .idAkun,
                                          ),
                                        );

                                    // Go to page terima kasih sudah rating
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE31E24),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
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
                              const SizedBox(height: 20),
                            ],
                          ),
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
