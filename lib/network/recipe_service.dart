import 'package:http/http.dart';

const String apiKey = '6d561fb96d3f20096ddfeaec088a1b63';
const String apiId = '0e245672';
const String apiUrl = 'https://api.edamam.com/search';

class RecipeService {
  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(''
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}

Future getData(String url) async {
  print('Calling url: $url');
  final response = await get(url);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    print(response.statusCode);
  }
}
