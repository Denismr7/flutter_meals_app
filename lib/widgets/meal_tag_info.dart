import 'package:flutter/material.dart';

class MealTagInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  const MealTagInfo(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(this.icon), SizedBox(width: 6), Text(this.text)],
    );
  }
}
