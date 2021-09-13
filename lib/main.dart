import 'package:assignment/providers/bulb.dart';
import 'package:assignment/screens/area_detail_screen.dart';
import 'package:flutter/material.dart';
import './screens/area_select_screen.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

void main() {
  runApp(App());
  FlutterDisplayMode.setHighRefreshRate();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color.fromRGBO(10, 77, 162, 0)));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => BulbColor())],
      child: MaterialApp(
        title: 'Assignment',
        theme: ThemeData(
            primaryColor: const Color.fromRGBO(10, 77, 162, 1),
            primaryColorDark: const Color.fromRGBO(8, 52, 108, 1),
            accentColor: const Color.fromRGBO(255, 169, 57, 1),
            textTheme: TextTheme(
                headline5: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                headline4: TextStyle(fontWeight: FontWeight.w700))),
        home: AreaScreen(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AreaDetailScreen.routeName:
              {
                return PageTransition(
                    child: AreaDetailScreen(),
                    type: PageTransitionType.fade,
                    settings: settings,
                    duration: Duration(milliseconds: 300));
              }
            case AreaScreen.routeName:
              {
                return PageTransition(
                    child: AreaScreen(),
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 300));
              }
            default:
              return null;
          }
        },
      ),
    );
  }
}
