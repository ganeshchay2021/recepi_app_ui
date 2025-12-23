import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_app/model/category_model.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/view/details/recipe_details.dart';
import 'package:recipe_app/view/home/widget/chef_profile.dart';
import 'package:recipe_app/view/home/widget/header_part.dart';
import 'package:recipe_app/view/home/widget/mysearch_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int selectedPage = 0;

  final List<IconData> icons = [
    Icons.home,
    Icons.chat,
    Icons.favorite,
    Icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //head Part
              HeaderPart(),

              SizedBox(height: 20),

              //search area
              MySearchField(),

              SizedBox(height: 20),

              //Popular Menu Item
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Popular menus",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              popularMeuItem(),

              SizedBox(height: 20),

              //popular menu item scrolling
              SingleChildScrollView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(recipeItems.length, (index) {
                    final recipe = recipeItems[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetails(recipe: recipe ,),
                          ),
                        );
                      },
                      child: Padding(
                        padding: index == 0
                            ? EdgeInsetsGeometry.only(left: 20, right: 15)
                            : EdgeInsetsGeometry.only(right: 15),
                        child: Container(
                          height: 260,
                          width: MediaQuery.of(context).size.width / 2.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(recipe.image),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 4,
                                  ),
                                ),
                                child: Icon(
                                  Iconsax.activity,
                                  size: 18,
                                  color: recipe.fav ? Colors.red : Colors.black,
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            recipe.name,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 16,
                                              height: 0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Icon(
                                              Iconsax.star,
                                              size: 18,
                                              color: Colors.amberAccent,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "${recipe.rate}",
                                              style: TextStyle(
                                                height: 0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 5),
                                    Text(
                                      "1 Bowl ${recipe.weight}g",
                                      style: TextStyle(
                                        fontSize: 12,
                                        height: 0,
                                        color: Colors.white70,
                                      ),
                                    ),

                                    SizedBox(height: 5),
                                    Text(
                                      "${recipe.calorie} Kkal | 25% AKL",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 20),

              //Category Item
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              //category scroll
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(recipeCategory.length, (index) {
                    final recipeCate = recipeCategory[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: index == 0
                            ? EdgeInsets.only(left: 20, right: 20)
                            : EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: recipeCate.color,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(recipeCate.image),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              recipeCate.name,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),

              //Chef profile
              ChefProfile(),
            ],
          ),
        ),
      ),

      //Bottom Navbar
      bottomSheet: Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.white70, spreadRadius: 1)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedPage = index;
                });
              },
              child: SizedBox(
                height: 40,
                width: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      icons[index],
                      size: 32,
                      color: selectedPage == index ? Colors.green : Colors.grey,
                    ),

                    selectedPage == index
                        ? Container(
                            height: 3,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  SingleChildScrollView popularMeuItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(menuItems.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      selectedIndex == index ? Colors.green : Colors.white,
                      selectedIndex == index
                          ? Colors.greenAccent
                          : Colors.white,
                    ],
                  ),
                ),
                child: Text(
                  menuItems[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.w500,
                    color: selectedIndex == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
