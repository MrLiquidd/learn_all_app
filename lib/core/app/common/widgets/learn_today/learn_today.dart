import 'package:flutter/material.dart';
import 'package:learn_all/core/core.dart';

class LearnToday extends StatelessWidget {
  const LearnToday({super.key});

  @override
  Widget build(BuildContext context) {
     // White container that overlaps the header
    return Positioned(
      bottom: -50, // Controls how much it overlaps
      left: 16,
      right: 16,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const LearnedToday(),
      ),
    );
  }
}
