import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_app/model/ingradients_model.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/view/details/widgets/circular_percent_indicator.dart';

class RecipeDetails extends StatefulWidget {
  final RecipeItems recipe;
  const RecipeDetails({super.key, required this.recipe});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.recipe.image),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 15,
              child: CircleAvatar(
                backgroundColor: Colors.black38,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.50,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 22,
                            backgroundImage: NetworkImage(widget.recipe.woner),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.recipe.wonerName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "12 Recipes shared",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${widget.recipe.rate}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 5),

                                  RatingBar.builder(
                                    itemSize: 18,
                                    initialRating: widget.recipe.rate,
                                    itemBuilder: (context, index) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.amberAccent,
                                      );
                                    },
                                    onRatingUpdate: (value) {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${widget.recipe.reviews} Reviews",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.recipe.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "1 Bowl (${widget.recipe.weight}g)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "See Details",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyProgressIndicatorValue(
                            name: "Crabs",
                            amount: "${widget.recipe.carb} g",
                            percentage: "(54 %)",
                            color: Colors.green,
                            data: 0.4,
                          ),
                          MyProgressIndicatorValue(
                            name: "Fats",
                            amount: "${widget.recipe.fat} g",
                            percentage: "(72 %)",
                            color: Colors.red,
                            data: 0.8,
                          ),
                          MyProgressIndicatorValue(
                            name: "Protine",
                            amount: "${widget.recipe.protein} g",
                            percentage: "(8 %)",
                            color: Colors.orange,
                            data: 0.2,
                          ),
                          MyProgressIndicatorValue(
                            name: "Calories",
                            amount: "${widget.recipe.calorie} g",
                            percentage: "(34 %)",
                            color: Colors.pink,
                            data: 0.6,
                          ),
                        ],
                      ),

                      SizedBox(height: 30),
                      //ingradents text
                      Row(
                        children: [
                          Text(
                            "Ingradents",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "See all",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      //Ingradents
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(ingredients.length, (index) {
                          final ingredient = ingredients[index];
                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: ingredient.color,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(ingredient.image),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  ingredient.name,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.50,
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.47,
              right: 35,
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: widget.recipe.fav ? Colors.red : Colors.black45,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, spreadRadius: 2),
                  ],
                ),
                child: Icon(Icons.favorite, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
