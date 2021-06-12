import 'package:flutter/material.dart';

import '../widgets/meal_tag_info.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText {
    String text;
    switch (complexity) {
      case Complexity.Simple:
        text = 'Simple';
        break;
      case Complexity.Challenging:
        text = 'Challenging';
        break;
      case Complexity.Hard:
        text = 'Hard';
        break;
      default:
        text = 'Unknown';
        break;
    }

    return text;
  }

  String get affordabilityText {
    String text;
    switch (affordability) {
      case Affordability.Affordable:
        text = 'Affordable';
        break;
      case Affordability.Pricey:
        text = 'Pricey';
        break;
      case Affordability.Luxurious:
        text = 'Luxurious';
        break;
      default:
        text = 'Unknown';
        break;
    }

    return text;
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: this.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    this.imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MealTagInfo(Icons.schedule, '$duration min'),
                  MealTagInfo(Icons.work, complexityText),
                  MealTagInfo(Icons.attach_money, affordabilityText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
