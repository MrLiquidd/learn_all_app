import 'package:flutter/material.dart';
import 'package:learn_all/core/core.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.title});

  final String title;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent.withAlpha(200),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.title,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Completed", style: AppTypography.smallText)
            ],
          ),
        ),
      ),
    );
  }
}
