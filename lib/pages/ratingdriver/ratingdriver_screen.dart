import 'package:flutter/material.dart';
import 'components/body.dart';

class RatingDriverScreen extends StatefulWidget {
  const RatingDriverScreen({super.key});

  @override
  State<RatingDriverScreen> createState() => _RatingDriverScreenState();
}

class _RatingDriverScreenState extends State<RatingDriverScreen> {
  int _selectedRating = 0;

  final TextEditingController _pesanController = TextEditingController();

  @override
  void dispose() {
    _pesanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(
        selectedRating: _selectedRating,
        onRatingChanged: (rating) {
          setState(() {
            _selectedRating = rating;
          });
        },
        pesanController: _pesanController,
      ),
    );
  }
}
