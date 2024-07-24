import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      height: 180,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadiusDirectional.circular(10)),
    );
  }
}