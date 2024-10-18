import 'package:learn_all/features/home/domain/entities/home/course/course.dart';

import 'course_link.dart';

class CourseModel {
  String? courseId;
  String? author;
  String? title;
  List<CourceLinkModel>? links;

  CourseModel.fromJson(Map<String, dynamic> data) {
    courseId = data['courseId'];
    author = data['author'];
    title = data['title'];
    // links =
    //     data['links'].map((link) => CourceLinkModel.fromJson(link)).toList();
  }
}

extension CourceModelx on CourseModel {
  CourseEntity toEntity(){
    return CourseEntity(
      courseId: courseId,
      author: author,
      title: title,
      links: links?.map((link) => link.toEntity()).toList(),
    );
  }
}
