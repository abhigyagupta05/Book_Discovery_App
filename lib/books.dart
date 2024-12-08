class Book {
  final int id;
  final String title;
  final String? coverImage;

  Book({
    required this.id,
    required this.title,
    this.coverImage,
  });

  factory Book.fromJSON(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      coverImage: json['formats']['image/jpeg']
    );
  }
}