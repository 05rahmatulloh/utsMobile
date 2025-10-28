class Food {
  final int id;
  final String name;
  final String image;
  final String description;

  Food({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
    );
  }
}
                                                                  