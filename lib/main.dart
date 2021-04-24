import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/details_screen.dart';
import 'package:food_app/constans.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(
          headline: TextStyle(fontWeight: FontWeight.bold),
          button: TextStyle(fontWeight: FontWeight.bold),
          title: TextStyle(fontWeight: FontWeight.bold),
          body1: TextStyle(color: kTextColor),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor.withOpacity(.26),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor,
          ),
          child: SvgPicture.asset("assets/icons/plus.svg"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 50),
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                "assets/icons/menu.svg",
                height: 11,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Simple way to find \nTasty food",
              style: Theme.of(context).textTheme.headline,
            ),
          ),

          // ScrollView()
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryTitle(
                  title: 'All',
                  active: true,
                ),
                CategoryTitle(
                  title: 'Italian',
                ),
                CategoryTitle(
                  title: 'Asian',
                ),
                CategoryTitle(
                  title: 'Chinese',
                ),
                CategoryTitle(
                  title: 'Burgers',
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kBorderColor),
            ),
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FoodCard(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DetailsScreen(
                          image: "assets/images/image_1.png",
                        );
                      }),
                    );
                  },
                  title: "Vegan salad bowl",
                  image: "assets/images/image_1.png",
                  price: 20,
                  calories: "420Kcal",
                  description:
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                ),
                FoodCard(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DetailsScreen(
                          image: "assets/images/image_2.png",
                        );
                      }),
                    );
                  },
                  title: "Vegan salad bowl",
                  image: "assets/images/image_2.png",
                  price: 18,
                  calories: "420Kcal",
                  description:
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final String title;
  final bool active;
  const CategoryTitle({
    Key key,
    this.title = '',
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 30),
      child: Text(
        title,
        style: Theme.of(context).textTheme.button.copyWith(
              color: active ? kPrimaryColor : kTextColor.withOpacity(.4),
            ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String title;
  final String ingredient;
  final String image;
  final int price;
  final String calories;
  final String description;
  final Function press;

  const FoodCard({
    Key key,
    this.title,
    this.ingredient,
    this.image = 'assets/images/image_1.png',
    this.price = 20,
    this.calories,
    this.description,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        height: 400,
        width: 270,
        child: Stack(
          children: [
            // Big light background
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 380,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: kPrimaryColor.withOpacity(.06),
                ),
              ),
            ),
            // Rounded background
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 181,
                width: 181,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor.withOpacity(.15),
                ),
              ),
            ),
            // Food Image
            Positioned(
              top: 0,
              left: -50,
              child: Container(
                height: 184,
                width: 276,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                ),
              ),
            ),
            // Price
            Positioned(
              right: 20,
              top: 80,
              child: Text(
                "\$$price",
                style: Theme.of(context).textTheme.headline.copyWith(color: kPrimaryColor),
              ),
            ),
            //  description
            Positioned(
              top: 201,
              left: 40,
              child: Container(
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      "With $ingredient",
                      style: TextStyle(
                        color: kTextColor.withOpacity(.4),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      description,
                      maxLines: 3,
                      style: TextStyle(
                        color: kTextColor.withOpacity(.65),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      calories,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
