class BookEntity {
  final String bookId;
  final String? image;
  final String title;
  final String? authorName;
  final int? pageCount;
  final num? rating;
  final String? categories;
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
