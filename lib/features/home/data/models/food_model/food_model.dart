class FoodModel {
  String? id;
  String title;
  String difficulty;
  String? portion;
  String? time;
  String? description;
  List<dynamic>? ingredients;
  String image;
   bool isFavourite;
  FoodModel({
    this.isFavourite=false,
    this.id,
    required this.title,
    required this.difficulty,
    this.portion,
    this.time,
    this.description,
    this.ingredients,
    required this.image,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
        id: json['id'],
        title: json['title'],
        difficulty: json['difficulty'],
        portion: json['portion'],
        time: json['time'],
        description: json['description'],
        ingredients: json['ingredients'],
        image: json['image']);
  }
}
