
import 'package:learn_all/features/home/domain/domain.dart';

class CourceLinkModel {
  String? linkId;
  String? link;

  CourceLinkModel.fromJson(Map<String, dynamic> data) {
    linkId = data['linkId'];
    link = data['link'];
  }
}

extension CourseLinkModelX on CourceLinkModel{
  CourselinkEntity toEntity(){
    return CourselinkEntity(
      linkId: linkId,
      link: link,
    );
  }
}
