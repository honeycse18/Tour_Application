import "package:cloud_firestore/cloud_firestore.dart";

class Tourist_Place_images {
  final String description;
  final String destination;
  final int budget;
  final List images;
  final String title;

  const Tourist_Place_images({
    required this.description,
    required this.destination,
    required this.budget,
    required this.images,
    required this.title,
  });
  factory Tourist_Place_images.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Tourist_Place_images(
      description: data['description'],
      destination: data['destination'],
      budget: data['budget'],
      images: data['images'],
      title: data['title'],
    );
  }
}
