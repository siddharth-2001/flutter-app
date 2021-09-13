import 'package:flutter/material.dart';
import './light_item.dart';

class LightList extends StatefulWidget {
  @override
  _LightListState createState() => _LightListState();
}

class _LightListState extends State<LightList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _widthAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _widthAnimation = Tween<Size>(begin: Size(500, 1), end: Size(0, 1)).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Container(
      height: 48,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: [
          AnimatedBuilder(
              animation: _widthAnimation,
              builder: (context, child) {
                return SizedBox(
                  width: _widthAnimation.value.width,
                  height: _widthAnimation.value.height,
                );
              }),
          LightItem('Main', 'assets/images/surface1.svg'),
          LightItem('Desk', 'assets/images/surface2.svg'),
          LightItem('Bed', 'assets/images/surface1.svg'),
          LightItem('Other', 'assets/images/surface1.svg'),
        ],
      ),
    );
  }
}
