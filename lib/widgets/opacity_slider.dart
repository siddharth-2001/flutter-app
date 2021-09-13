import 'package:assignment/providers/bulb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class OpacitySlider extends StatefulWidget {
  const OpacitySlider({Key? key}) : super(key: key);

  @override
  _OpacitySliderState createState() => _OpacitySliderState();
}

class _OpacitySliderState extends State<OpacitySlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _doubleAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _doubleAnimation = Tween<double>(
            begin: 0,
            end: Provider.of<BulbColor>(context, listen: false).opacity)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final opacity = Provider.of<BulbColor>(context);
    final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Intensity',
            style: theme.textTheme.headline5!
                .copyWith(color: theme.primaryColorDark),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/images/solution2.svg'),
              Container(
                width: 275,
                child: SfSliderTheme(
                  data: SfSliderThemeData(
                      tickOffset: Offset(0.0, 10.0),
                      thumbColor: Colors.white,
                      activeTrackHeight: 2,
                      inactiveTrackHeight: 2,
                      activeTrackColor: Colors.amber),
                  child: AnimatedBuilder(
                    animation: _doubleAnimation,
                    builder: (context, ch) {
                      return SfSlider(
                          inactiveColor: const Color.fromRGBO(246, 248, 251, 1),
                          max: 100,
                          min: 0,
                          interval: 20,
                          showTicks: true,
                          value: _doubleAnimation.isCompleted
                              ? opacity.opacity
                              : _doubleAnimation.value,
                          onChanged: (value) {
                            setState(() {
                              opacity.changeOpacity(value);
                            });
                          });
                    },
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/images/solution1.svg',
                color: Colors.amber,
              )
            ],
          ),
        ],
      ),
    );
  }
}
