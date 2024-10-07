import 'package:flutter/material.dart';
import 'package:learn_all/core/core.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
    );
  }

    PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Account",
            style: AppTypography.bigTitle,
          ),
        ),
        backgroundColor: AppColors.lightBackground,
        centerTitle: false,
      ),
    );
  }
}