import 'package:recipes/data/models/ingredient.dart';

import 'models/recipe.dart';

abstract class Repository {
  // Find Methods
  /**
   * Return all recipes in the repository.
   */
  List<Recipe> findAllRecipes();

  /**
   * Find a specific recipe by its ID.
   */
  Recipe findRecipeById(int id);

  /**
   * Return all ingredients.
   */
  List<Ingredient> findAllIngredients();

  /**
   * Find all the ingredients for the given recipe ID.
   */
  List<Ingredient> findRecipeIngredients(int recipeId);

  // Insert Methods
  int insertRecipe(Recipe recipe);

  List<int> insertIngredients(List<Ingredient> ingredients);

  // Delete Methods
  /**
   * Delete the given recipe.
   */
  void deleteRecipe(Recipe recipe);

  /**
   * Delete the given ingredient.
   */
  void deleteIngredient(Ingredient ingredient);

  /**
   * Delete all the given ingredients.
   */
  void deleteIngredients(List<Ingredient> ingredients);

  /**
   * Delete all the given ingredients.
   */
  void deleteRecipeIngredients(int recipeId);

  // Initializing and closing methods
  /**
   * Allow the repository to initialize. Databases might need to do some startup
   * work.
   */
  Future init();

  /**
   * Close the repository.
   */
  void close();
}
