import 'package:bluestacks_assignment/model/user.dart';
import 'package:bluestacks_assignment/presentation/pages/home_page.dart';
import 'package:bluestacks_assignment/presentation/pages/login_page.dart';
import 'package:bluestacks_assignment/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = "SplashPage";

  const SplashPage({Key key = const Key("SplashPage")}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigation(context);
    return Scaffold(
      body: Container(
        // color: primaryColor,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<void> _navigation(BuildContext context) async {
    try {
      User? user = await preferenceService.getAuthUser();
      if (user != null) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }
      // Navigator.pushReplacementNamed(context, HomePage.routeName);
    } catch (e) {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
      final snackBar = SnackBar(
        content: Text(AppLocalizations.of(context)!.unExpectedError),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
