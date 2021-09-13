import 'package:assignment/providers/bulb.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({Key? key}) : super(key: key);

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _widthAnimation = Tween<Size>(begin: Size(0, 48), end: Size(12, 48))
        .animate(
            CurvedAnimation(curve: Curves.easeOutCubic, parent: _controller));
  }

  Widget colorButton(context, color) {
    final bulbColor = Provider.of<BulbColor>(context, listen: false);
    return GestureDetector(
      onTap: () {
        bulbColor.changeColor(color);
      },
      child: CircleAvatar(
        backgroundColor: color,
      ),
    );
  }

  AnimatedBuilder animatedSizedBox() {
    return AnimatedBuilder(
        animation: _widthAnimation,
        builder: (context, ch) {
          return SizedBox(
            width: _widthAnimation.value.width,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    final theme = Theme.of(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Colors',
            style: theme.textTheme.headline5!
                .copyWith(color: theme.primaryColorDark),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                colorButton(context, Color.fromRGBO(255, 155, 155, 1)),
                animatedSizedBox(),
                colorButton(context, Color.fromRGBO(148, 235, 158, 1)),
                animatedSizedBox(),
                colorButton(context, Color.fromRGBO(148, 202, 235, 1)),
                animatedSizedBox(),
                colorButton(context, Color.fromRGBO(165, 148, 235, 1)),
                animatedSizedBox(),
                colorButton(context, Color.fromRGBO(222, 148, 235, 1)),
                animatedSizedBox(),
                colorButton(context, Color.fromRGBO(235, 208, 148, 1)),
                animatedSizedBox(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: theme.primaryColorDark,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
