import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_all/features/home/domain/entities/home/course_link.dart';

part 'course.g.dart';

@HiveType(typeId: 1)
class CourseEntity {
  @HiveField(0)
  String? courseId;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? title;
  @HiveField(3)
  List<CourselinkEntity>? links;

  CourseEntity({this.courseId, this.author, this.title, this.links});
}
