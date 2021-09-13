import 'package:assignment/widgets/bulb_color_selector.dart';
import 'package:assignment/widgets/light_list.dart';
import 'package:assignment/widgets/opacity_slider.dart';
import 'package:assignment/widgets/scene_grid.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bottom_bar.dart';
import '../widgets/light_bulb.dart';

class AreaDetailScreen extends StatelessWidget {
  const AreaDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/detail';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final theme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            //  padding: EdgeInsets.symmetric(horizontal: 16),
            height: deviceSize.height * 0.3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 48,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed('/areas');
                                      },
                                      child: Icon(
                                        Icons.keyboard_backspace_rounded,
                                        color:  Colors.white,
                                      )),
                                ),
                                Flexible(
                                  flex: 5,
                                  child: Text(
                                    args['name'],
                                    style: theme.textTheme.headline4!
                                        .copyWith(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text('${args['lights'].toString()} Lights',
                                style: theme.textTheme.headline5!.copyWith(
                                  color: theme.accentColor,
                                ))
                          ],
                        ),
                      ),
                      Container(
                        child: LightBulb(),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    child: Align(
                        alignment: Alignment.centerLeft, child: LightList())),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(246, 248, 251, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  )),
              height: deviceSize.height * 0.7 - 56,
              child: Column(
                children: <Widget>[
                  OpacitySlider(),
                  SizedBox(
                    height: 32,
                  ),
                  
                  ColorSelector(),
                  SizedBox(height: 24,),
                  Flexible(child: SceneGrid()),
                ],
              ))
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
