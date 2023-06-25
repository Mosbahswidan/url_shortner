import 'package:hive_flutter/hive_flutter.dart';
part 'url_entity.g.dart';
@HiveType(typeId: 0)
class UrlEntity {
  @HiveField(0)
  final String urlString;

  UrlEntity({required this.urlString});
}
