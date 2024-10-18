import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_all/core/core.dart';
import 'package:learn_all/features/cources/presentation/screens/cources/bloc/bloc.dart';
import 'package:learn_all/features/home/domain/entities/entities.dart';

import 'widgets/course_card.dart';

class CourcesPage extends StatefulWidget {
  const CourcesPage({super.key});

  @override
  State<CourcesPage> createState() => _CourcesPageState();
}

class _CourcesPageState extends State<CourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedGradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RefreshIndicator(
              onRefresh: () {
                return context.read<MyCourseCubit>().getData();
              },
              child: _buildBody(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<MyCourseCubit, MyCourseState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (data) => _success(data),
          failure: (data) => const Center(child: Text("failure")),
        );
      },
    );
  }

  Widget _success(List<CourseEntity?>? entities) {
    if (entities == null || entities.isEmpty) {
      return Container();
    } else {
      return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8.0),
        children: entities
            .map(
              (course) => GestureDetector(
                onTap: () {
                  print(course?.courseId ?? "");
                },
                child: CourseCard(title: course?.title ?? ""),
              ),
            )
            .toList(),
      );
    }
  }
}
