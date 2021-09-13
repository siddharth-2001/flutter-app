import '../widgets/area_grid.dart';
import '../widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class AreaScreen extends StatelessWidget {
  const AreaScreen({Key? key}) : super(key: key);
  static const routeName = '/areas';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: deviceSize.height * 0.225,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        'Control Panel',
                        style: theme.textTheme.headline4!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    CircleAvatar(
                      //child: SvgPicture.asset('assets/images/user.svg'),
                      maxRadius: 32,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              height: deviceSize.height * 0.775 - 56,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(246, 248, 251, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 56,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('All Rooms',
                            style: theme.textTheme.headline5!
                                .copyWith(color: theme.primaryColorDark)),
                      ],
                    ),
                  ),
                  Flexible(
                    child: AreaGrid(),
                  ),
                ],
              )),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
