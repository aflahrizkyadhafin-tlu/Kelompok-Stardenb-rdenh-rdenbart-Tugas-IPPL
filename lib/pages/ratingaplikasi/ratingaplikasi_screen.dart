import 'package:flutter/material.dart';
import 'package:frontendmykurir_rizqi/pages/ratingaplikasi/components/body.dart'; // Mengarah ke folder components

class RatingAplikasiScreen extends StatefulWidget {
  const RatingAplikasiScreen({super.key});

  @override
  State<RatingAplikasiScreen> createState() => _RatingAplikasiScreenState();
}

class _RatingAplikasiScreenState extends State<RatingAplikasiScreen> {
  int _selectedRating = 0;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RatingBody(
        selectedRating: _selectedRating,
        onRatingChanged: (newRating) {
          setState(() {
            _selectedRating = newRating;
          });
        },
        feedbackController: _feedbackController,
      ),
    );
  }
}
