import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/home/presentation/screens/home/bloc/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: RefreshIndicator(
          onRefresh: () {
            return context.read<HomeCubit>().getUser();
          },
          child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (data) => _success(data),
          failure: (data) => const Center(child: Text("failure")),
          showHide: () => const Center(child: Text("show")),
          init: () => const Center(child: Text("init")),
        );
      },
    );
  }

  Widget _success(data) {
    print(data);
    return Center(
      child: Text(data.email),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Home",
            style: AppTypography.bigTitle,
          ),
        ),
        backgroundColor: AppColors.lightBackground,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
