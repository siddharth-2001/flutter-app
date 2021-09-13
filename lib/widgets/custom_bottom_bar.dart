import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: const Color.fromRGBO(238, 242, 247, 1),
            blurRadius: 7,
            spreadRadius: 5)
      ]),
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/bulb.svg'),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/areas');
            },
            icon: SvgPicture.asset('assets/images/Icon feather-home.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/Icon feather-settings.svg'),
          ),
        ],
      ),
    );
  }
}
