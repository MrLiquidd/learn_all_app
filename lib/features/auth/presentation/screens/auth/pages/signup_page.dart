import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_all/core/app/app.dart';
import 'package:learn_all/features/auth/data/models/models.dart';
import 'package:learn_all/features/auth/presentation/screens/screens.dart';

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
    return BlocListener<AuthCubit, AuthState>(
      listener: (_, state) {
        state.whenOrNull(success: (data) {
          context.go(Routes.home.path);
        }, failure: (message) {
          var snackBar = SnackBar(content: Text(message.message.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.1,
                ),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
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
                            onPressed: () async {
                              context.read<AuthCubit>().signUp(CreateUserReq(
                                  fullname: _fullnameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text));
                            },
                            title: 'Sign In',
                          ),
                        ],
                      ),
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
      controller: _fullnameController,
      keyboardType: TextInputType.name,
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
              context.go(Routes.login.path);
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
