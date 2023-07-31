import 'package:flutter/material.dart';
import 'package:foodapi/model/recipe.dart';
import 'package:foodapi/model/recipe_api.dart';
import 'package:foodapi/screen/rec_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe>? recpie;
  bool isLoading = true;

  Future<void> getRecpie() async {
    recpie = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
    print(recpie!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecpie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 10,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.restaurant_menu),
              SizedBox(
                width: 20,
              ),
              Text('Food Recipe')
            ],
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : ListView.builder(
                itemCount: recpie!.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                    title: recpie![index].name.toString(),
                    cookTime: recpie![index].totalTime.toString(),
                    rating: recpie![index].rating.toString(),
                    thumbnailUrl: recpie![index].images.toString(),
                  );
                }));
  }
}
