import 'package:http/http.dart';

const String apiKey = '8703e1718ae423be5f41436ff66351b7';
const String apiId = '0cd1eb50';
const String apiUrl = 'https://api.edamam.com/search';

class RecipeService {
  /**
   * getData returns a Future (with an upper case “F”) because an API’s
   * returned data type is determined in the future (lower case “f”).
   * async signifies this method is an asynchronous operation.
   */
  Future getData(String url) async {
    // For debugging purposes, you print out the passed-in URL.
    print('Calling url: $url');
    // response doesn’t have a value until await completes.
    // Response and get() are from the HTTP package.
    // get fetches data from the provided url.
    final response = await get(Uri.parse(url));
    // A statusCode of 200 means the request was successful.
    if (response.statusCode == 200) {
      // You return the results embedded in response.body.
      return response.body;
    } else {
      // Otherwise, you have an error — print the statusCode to the console.
      print(response.statusCode);
    }
  }

  /**
   * Create a new method, getRecipes(), with the parameters query, from and to.
   * These let you get specific pages from the complete query.
   * from starts at 0 and to is calculated by adding the from index to your page
   * size. You use type Future<dynamic> for this method because you don‘t know
   * which data type it will return or when it will finish.
   * async signals that this method runs asynchronously.
   */
  Future<dynamic> getRecipes(String query, int from, int to) async {
    // Use final to create a non-changing variable.
    // You use await to tell the app to wait until getData returns its result.
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}
