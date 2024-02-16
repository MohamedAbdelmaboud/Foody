import 'dart:math';

int generateRandomIngredientsNum() {
  return Random().nextInt(10) + 5;
}

int generateRandomTime() {
  return Random().nextInt(60) + 10;
}

List<String> generateRandomIngredients() {
  List<String> randomIngredients = [];
  Random random = Random();

  for (int i = 0; i < 5; i++) {
    int index = random.nextInt(ingredients.length);
    randomIngredients.add(ingredients[index]);
  }

  return randomIngredients;
}

List<String> ingredients = [
  "2 tbsp vegetable oil",
  "1 tsp mustard seeds",
  "1 tsp chana dal",
  "½ tsp white urad dal",
  "10-12 fresh curry leaves",
  "½ tsp ground turmeric",
  "Juice 2 lemons",
  "1 tsp salt",
  "½ tsp sugar (optional)",
  "400g (cooked weight) cooked and cooled basmati rice",
  "1 tbsp olive oil, plus extra to grease",
  "250g plain flour, plus extra to dust",
  "125g salted plant butter (we used Flora salted plant butter), cubed",
  "150g mixed mushrooms, cut into bite-size chunks",
  "1 tbsp fresh thyme leaves",
  "280g pack extra-firm tofu (we used Tofoo), drained and roughly chopped",
  "150ml single soy cream alternative (we used Alpro)",
  "75ml unsweetened soy, almond or oat milk",
  "2 tsp roasted garlic purée",
  "Pinch ground turmeric",
  "4 tbsp instant mashed potato flakes (check they are dairy free)",
  "2 tbsp tahini paste",
  "100g smoked vegan cheese alterative, coarsely grated",
  "Large handful baby leaf spinach",
  "3 spring onions, white parts only, sliced",
  "23cm loose-bottomed deep tart tin"
];
