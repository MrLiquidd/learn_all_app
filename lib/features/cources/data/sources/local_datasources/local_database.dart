import 'package:learn_all/features/cources/domain/domain.dart';

abstract class LocalDatabase {
    Future<List<UserCourseEntity?>?> getCources();
}