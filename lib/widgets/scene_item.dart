import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SceneItem extends StatelessWidget {
  final String name;
  final Color color1;
  final Color color2;
  SceneItem(this.name, this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 144,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color1,
            color2,
          ]),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            'assets/images/solution1.svg',
            color: Colors.white,
          ),
          Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
