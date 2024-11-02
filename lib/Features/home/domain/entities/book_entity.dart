import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final int? pageCount;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final String? categories;
  @HiveField(7)
  final String? previewLink;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.pageCount,
    required this.rating,
    required this.categories,
    required this.previewLink,
  });
}
