class ContactModel {
  final int? id;
  final String name;
  final bool hasImage;
  final String? imageUrl;

  ContactModel({
    this.id,
    required this.name,
    required this.hasImage,
    this.imageUrl,
  });

  // Convert Contact to Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'hasImage': hasImage ? 1 : 0,
      'imageUrl': imageUrl,
    };
  }

  // Create Contact from Map (database result)
  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'] as int,
      name: map['name'] as String,
      hasImage: map['hasImage'] == 1,
      imageUrl: map['imageUrl'],
    );
  }

  @override
  String toString() {
    return 'Contact(id: $id, name: $name, hasImage: $hasImage, imageUrl: $imageUrl)';
  }
}