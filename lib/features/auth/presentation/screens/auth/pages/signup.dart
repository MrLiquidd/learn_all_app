import 'package:flutter/material.dart';
import 'package:learn_all/app/common/helpers/dark_mode/is_dark_mode.dart';
import 'package:learn_all/app/common/widgets/buttons/basic_app_button.dart';
import 'package:learn_all/features/auth/presentation/screens/auth/pages/signin.dart';
import 'package:learn_all/app/library/theme/app_colors.dart';
import 'package:learn_all/app/library/theme/app_typography.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
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
                      "Sign up!",
                      style: AppTypography.bigTitle,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    _fullnameField(context),
                    const SizedBox(
                      height: 15,
                    ),
                    _emailField(context),
                    const SizedBox(
                      height: 15,
                    ),
                    _passwordField(context),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) => SignupPage(),
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

  Widget _fullnameField(BuildContext context) {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Your name or nickname',
        fillColor: context.isDarkMode ? AppColors.darkGrey : AppColors.white,
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
            "Already have an account? ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const SigninPage(),
                ),
              );
            },
            child: const Text(
              "Login",
            ),
          ),
        ],
      ),
    );
  }
}
