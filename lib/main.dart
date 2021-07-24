import 'package:bluestacks_assignment/presentation/pages/home_page.dart';
import 'package:bluestacks_assignment/presentation/pages/login_page.dart';
import 'package:bluestacks_assignment/presentation/pages/splash_page.dart';
import 'package:bluestacks_assignment/store/game_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GameStore>.value(
          value: GameStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (BuildContext context) => SplashPage(),
          HomePage.routeName: (BuildContext context) => HomePage(),
          LoginPage.routeName:(BuildContext context) =>LoginPage(),
        },
      ),
    );
  }
}
