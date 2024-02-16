import 'dart:math';

int generateRandomIngredients() {
  return Random().nextInt(10) + 5;
}

int generateRandomTime() {
  return Random().nextInt(60) + 10;
}
