import 'package:flutter/material.dart';
import 'package:learn_all/core/core.dart';

class LearnedToday extends StatelessWidget {
  const LearnedToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Learned today',
              style: TextStyle(
                  fontSize: 16,
                  height: 20 / 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'My courses',
                style: TextStyle(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Text(
              '46min',
              style: AppTypography.title,
            ),
            Text(
              ' / 60min',
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const PercentProgressIndicator(
          percent: 0.5,
        )
      ],
    );
  }
}
