class FoodModel {
  String? id;
  String? title;
  String? difficulty;
  String? portion;
  String? time;
  String? description;
  List<dynamic>? ingredients;
  String? image;

  FoodModel({
    this.id,
    this.title,
    this.difficulty,
    this.portion,
    this.time,
    this.description,
    this.ingredients,
    this.image,
  });

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    difficulty = json['difficulty'];
    portion = json['portion'];
    time = json['time'];
    description = json['description'];
    ingredients = json['ingredients'];
    image = json['image'];
  }
}
