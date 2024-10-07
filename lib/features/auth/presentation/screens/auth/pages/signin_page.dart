import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_all/core/app/app.dart';
import 'package:learn_all/features/auth/data/models/models.dart';
import 'package:learn_all/features/auth/presentation/screens/screens.dart';


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
                            onPressed: () async {
                              context.read<AuthCubit>().signIn(SigninUserReq(
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
              context.go(Routes.register.path);
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
