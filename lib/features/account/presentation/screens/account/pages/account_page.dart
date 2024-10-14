import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/auth/presentation/screens/auth/bloc/auth_cubit.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(success: (data) {
          context.go(Routes.home.path);
        }, failure: (message) {
          var snackBar = SnackBar(content: Text(message.message.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Center(
            child: BasicAppButton(
                onPressed: () async {
                  context.read<AuthCubit>().logout();
                },
                title: "Выйти"),
          ),
        ),
      ),
    );
  }
}
