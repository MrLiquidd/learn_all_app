import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_all/core/app/library/theme/app_colors.dart';

class CourcesPage extends StatefulWidget {
  const CourcesPage({super.key});

  @override
  State<CourcesPage> createState() => _CourcesPageState();
}

class _CourcesPageState extends State<CourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: () {
              return context.read().getUser();
            },
            child: Container(),
          ),
        ),
      ),
    );
  }

  // Widget _buildBody() {
  //   return BlocBuilder(
  //     builder: (context, state) {
  //       return state.when(
  //         loading: () => const Center(child: CircularProgressIndicator()),
  //         success: (data) => _success(data ?? UserEntity()),
  //         failure: (data) => const Center(child: Text("failure")),
  //       );
  //     },
  //   );
  // }

  // Widget _success(UserEntity data) {
  //   return Container();
  // }
}
