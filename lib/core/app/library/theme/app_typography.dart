import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Typography namings are up to you
class AppTypography {

  static const bigTitle = TextStyle(
    fontSize: 35,
    height: 24 / 24,
    fontWeight: FontWeight.w600,
  );

  static const title = TextStyle(
    fontSize: 20,
    height: 24 / 20,
    fontWeight: FontWeight.w600,
  );

  static const text = TextStyle(
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w500,
  );

  static const smallText = TextStyle(
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w500,
  );

  static final smallTextSecondary = smallText.copyWith(color: AppColors.grey);
}
