import 'package:flutter/material.dart';

import '../../nutrition/nutrition_screen.dart';

class NutritionButton extends StatelessWidget {
  NutritionButton({Key? key}) : super(key:key) {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NutritionScreen())
          );
        } ,
        child: Row(
          children: [
            Icon(Icons.search),
            Text("Tra cứu dinh dưỡng")
          ],
        )
    );
  }
}