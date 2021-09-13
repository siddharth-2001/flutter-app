import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AreaItem extends StatelessWidget {
  final String imgAsset;
  final String text;
  final int lights;
  AreaItem(this.imgAsset, this.text, this.lights);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/detail', arguments: {'name': text, 'lights': lights});
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: const Color.fromRGBO(238, 242, 247, 1),
                    blurRadius: 7,
                    spreadRadius: 5)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  imgAsset,
                  height: 48,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  text,
                  softWrap: false,
                  style: theme.textTheme.headline5,
                ),
                SizedBox(
                  height: 8,
                ),
                Text('$lights Lights',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: theme.accentColor))
              ],
            ),
          )),
    );
  }
}
