import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/controllers/rating_driver_controller.dart';
import 'package:mykurir/models/rating_kurir.dart';

class Body extends StatelessWidget {
  final int selectedRating;
  final ValueChanged<int> onRatingChanged;
  final TextEditingController pesanController;

  const Body({
    super.key,
    required this.selectedRating,
    required this.onRatingChanged,
    required this.pesanController,
  });

  String _getRatingText() {
    switch (selectedRating) {
      case 1:
        return 'Sangat Kurang';
      case 2:
        return 'Kurang';
      case 3:
        return 'Cukup';
      case 4:
        return 'Baik';
      case 5:
        return 'Sangat Baik';
      default:
        return 'Tap to rate your experience';
    }
  }

  @override
  Widget build(BuildContext context) {
    final LoadingController loadingController = Get.put(LoadingController());
    final RatingDriverController ratingDriverController = Get.put(
      RatingDriverController(),
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- Header ---
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF2E2E2E),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Rating Driver',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2E2E2E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // --- Avatar Driver ---
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 13,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/photoProfile.svg',
                    width: 500,
                    height: 500,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // --- Nama Driver ---
              Text(
                'Raffy Dwi Anggara',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),

              // --- Bintang Rating ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final isSelected = index < selectedRating;
                  return GestureDetector(
                    onTap: () => onRatingChanged(index + 1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Icon(
                        Icons.star_rounded,
                        size: 50,
                        color: isSelected
                            ? const Color(0xFFFA8E10)
                            : const Color(0xFFE0E0E0),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 12),

              // --- Teks Indikator Bintang ---
              Text(
                _getRatingText(),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: selectedRating == 0
                      ? FontWeight.w400
                      : FontWeight.w700,
                  color: selectedRating == 0
                      ? const Color(0xFF757575)
                      : Colors.black,
                ),
              ),
              const SizedBox(height: 40),

              // --- Label Pesan ---
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pesan :',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // --- Text Area Pesan ---
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFE5B8B8),
                    width: 1.5,
                  ),
                ),
                child: TextField(
                  controller: pesanController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                    hintText: 'Tulis pesan Anda di sini...',
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
                    ratingDriverController.beriRating(
                      RatingKurir(
                        pesan: pesanController.text.trim(),
                        rating: selectedRating.toDouble(),
                        idPengiriman: "",
                        idKurir: "",
                      ),
                    );
                    // Navigator.pushReplacementNamed(context, '/detail_pesanan');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA60B14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Kirim',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
