import 'package:assignment/providers/bulb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LightBulb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bulbColor = Provider.of<BulbColor>(context);
    return Container(
      height: 140,
      child: Stack(
        children: [
          Positioned(
              left: 50,
              top: 100,
              child: CircleAvatar(
                maxRadius: 20,
                child: Container(
                  decoration: BoxDecoration(
                      color: bulbColor.bulbColor
                          .withOpacity(bulbColor.opacity / 100),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: bulbColor.bulbColor
                                .withOpacity(bulbColor.opacity / 100),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ]),
                ),
              )),
          Positioned(child: SvgPicture.asset('assets/images/Group 38.svg')),
        ],
      ),
    );
  }
}
