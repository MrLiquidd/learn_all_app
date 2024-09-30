import 'package:flutter/material.dart';
import 'package:learn_all/app/common/helpers/dark_mode/is_dark_mode.dart';
import 'package:learn_all/app/common/widgets/buttons/basic_app_button.dart';
import 'package:learn_all/features/auth/presentation/screens/auth/pages/signup.dart';
import 'package:learn_all/app/library/theme/app_colors.dart';
import 'package:learn_all/app/library/theme/app_typography.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQuery.size.width * 0.1,
          ),
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome back!",
                      style: AppTypography.bigTitle,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    _emailField(context),
                    const SizedBox(
                      height: 15,
                    ),
                    _passwordField(context),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) => (),
                        //   ),
                        // );
                      },
                      child: const Text(
                        "Forgot password?",
                      ),
                    ),
                    BasicAppButton(
                      onPressed: () {},
                      title: 'Sign In',
                    ),
                    _signUpText(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'E-mail',
        fillColor: context.isDarkMode ? AppColors.darkGrey : AppColors.white,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Password',
        fillColor: context.isDarkMode ? AppColors.darkGrey : AppColors.white,
      ),
    );
  }

  Widget _signUpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not A Member? ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const SignupPage(),
                ),
              );
            },
            child: const Text(
              "Register Now",
            ),
          ),
        ],
      ),
    );
  }
}
