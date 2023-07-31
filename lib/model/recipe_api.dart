import 'dart:convert';

import 'package:foodapi/model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
//   const unirest = require("unirest");

// const req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"limit": "24",
// 	"start": "0"
// });

// req.headers({
// });

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24", "start": "0", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "cd325892cbmshe00de6984611ccfp1f53e7jsnec73397add05",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": 'true'
    });

    Map data = jsonDecode(response.body);
    List temp = [];
    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }
    return Recipe.recpieFromSnapshot(temp);
  }
}
