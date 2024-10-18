import 'package:injectable/injectable.dart';
import 'package:learn_all/features/cources/domain/domain.dart';
import 'package:learn_all/utils/services/hive/hive.dart';

import 'local_database.dart';

@Singleton(as: LocalDatabase)
class LocalDatabaseImpl implements LocalDatabase {
  LocalDatabaseImpl(this.mainBoxMixin);

  final MainBoxMixin mainBoxMixin;

  @override
  Future<List<UserCourseEntity?>?> getCources() async {
    final List<UserCourseEntity>? courses =
        await mainBoxMixin.getAll(MainBoxKeys.courses);
    print(courses);
    return null;
  }
}
