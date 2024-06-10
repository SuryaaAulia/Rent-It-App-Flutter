class Facility {
  final int id;
  final String image;
  final String name;
  final String description;
  final int price;

  Facility({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      price: (json['price']),
    );
  }
}
