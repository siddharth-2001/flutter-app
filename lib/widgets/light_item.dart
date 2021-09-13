import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LightItem extends StatefulWidget {
  @override
  _LightItemState createState() => _LightItemState();
  final String name;
  final String assetPath;
  LightItem(this.name, this.assetPath);
}

class _LightItemState extends State<LightItem> {
  bool _isToggled = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: _isToggled ? Colors.white : theme.primaryColorDark,
            fixedSize: Size(128, 24),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {
            setState(() {
              _isToggled = !_isToggled;
            });
          },
          icon: SvgPicture.asset(
            widget.assetPath,
            color: _isToggled ? theme.primaryColorDark : Colors.white,
          ),
          label: Text(
            '${widget.name} Light',
            style: TextStyle(
                color: _isToggled ? theme.primaryColorDark : Colors.white),
          )),
    );
  }
}
