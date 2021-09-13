import 'package:assignment/widgets/scene_item.dart';
import 'package:flutter/material.dart';

class SceneGrid extends StatefulWidget {
  const SceneGrid({Key? key}) : super(key: key);

  @override
  _SceneGridState createState() => _SceneGridState();
}

class _SceneGridState extends State<SceneGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _doubleAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _doubleAnimation = Tween<double>(begin: 0, end: 40).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _doubleAnimation,
      builder: (context, ch) {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Scenes',
                  style: theme.textTheme.headline5!
                      .copyWith(color: theme.primaryColorDark),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SceneItem('Birthday', Color.fromRGBO(255, 155, 155, 1),
                        Color.fromRGBO(255, 182, 147, 1)),
                    SizedBox(
                      width: _doubleAnimation.value,
                    ),
                    SceneItem('Party', Color.fromRGBO(166, 147, 235, 1),
                        Color.fromRGBO(211, 147, 235, 1)),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SceneItem('Relax', Color.fromRGBO(147, 202, 235, 1),
                        Color.fromRGBO(147, 218, 235, 1)),
                    SizedBox(
                      width: _doubleAnimation.value,
                    ),
                    SceneItem('Fun', Color.fromRGBO(137, 221, 148, 1),
                        Color.fromRGBO(183, 234, 146, 1)),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
