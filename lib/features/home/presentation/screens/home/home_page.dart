import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/home/domain/entities/entities.dart';
import 'package:learn_all/features/home/presentation/screens/home/bloc/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
              onRefresh: () {
                return context.read<HomeCubit>().getUser();
              },
              child: _buildBody()),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (data) => _success(data ?? UserEntity()),
          failure: (data) => const Center(child: Text("failure")),
        );
      },
    );
  }

  Widget _success(UserEntity data) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _appBar(data),
            _header(data),

            _learningPlan(data),
          ],
        ),
      ),
    );
  }

  Widget _header(UserEntity data) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          height: 150,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, ${data.fullname ?? "Anonim"}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.blue),
                  ),
                ],
              ),
              const Text(
                'Let’s start learning',
                style: TextStyle(color: Colors.white),
              ),
              // Progress bar
            ],
          ),
        ),
        // White container that overlaps the header
        Positioned(
          bottom: -50, // Controls how much it overlaps
          left: 16,
          right: 16,
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const LearnedToday(),
          ),
        ),
      ],
    );
  }

  Widget _learningPlan(UserEntity data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        // Learning Plan
        const Text(
          'Learning Plan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildLearningPlanItem('Flutter Base', 40, 48),
              const SizedBox(height: 16),
              _buildLearningPlanItem('Product Design', 6, 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLearningPlanItem(String title, int progress, int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircularProgressIndicator(
              value: progress / total,
              color: Colors.blue,
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(width: 16),
            Text(title),
          ],
        ),
        Text(
          '$progress/$total',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
