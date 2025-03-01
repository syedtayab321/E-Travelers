class BlogModel {
  String id;
  String title;
  String content;
  String author;
  String image;
  DateTime createdAt;
  String blogType;
  List<dynamic> tags;
  BlogModel({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.image,
    required this.createdAt,
    required this.blogType,
    required this.tags,
  });

  // Convert Model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author': author,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'blogType': blogType,
      'tags': tags,
    };
  }

  // Factory method to create a model from Firestore snapshot
  factory BlogModel.fromMap(Map<String, dynamic> map, String documentId) {
    return BlogModel(
      id: documentId,
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      author: map['author'] ?? '',
      image: map['image'] ?? '',
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      blogType: map['blogType'] ?? '',
      tags: map['tags']?? '',
    );
  }
}
