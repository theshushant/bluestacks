import 'package:bluestacks_assignment/presentation/custom/store_observer.dart';
import 'package:bluestacks_assignment/presentation/pages/home_page.dart';
import 'package:bluestacks_assignment/store/game_store.dart';
import 'package:bluestacks_assignment/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "LoginPage";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Map<String, String> map = {};

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.07,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              top: height * 0.02,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.08,
                    right: width * 0.08,
                    bottom: height * 0.04,
                  ),
                  child: Image.asset(
                    "assets/images/logo.png",
                    color: primaryColor,
                  ),
                ),
                _loginPage(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginPage(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: _fieldInputDecoration(
              context,
              hintText: AppLocalizations.of(context)!.userName,
            ),
            validator: (String? value) {
              if (value != null && value.isEmpty) {
                return AppLocalizations.of(context)!.required;
              }
              if (value != null && value.length < 3) {
                return AppLocalizations.of(context)!.userName +
                    AppLocalizations.of(context)!.minLineRequired;
              }
              if (value != null && value.length > 10) {
                return AppLocalizations.of(context)!.userName +
                    AppLocalizations.of(context)!.maxLineRequired;
              }
              return null;
            },
            onSaved: (String? value) {
              map["user_name"] = value!;
            },
          ),
          SizedBox(
            height: 14,
          ),
          TextFormField(
            obscureText: true,
            decoration: _fieldInputDecoration(
              context,
              hintText: AppLocalizations.of(context)!.password,
            ),
            validator: (String? value) {
              if (value != null && value.isEmpty) {
                return AppLocalizations.of(context)!.required;
              }
              if (value != null && value.length < 3) {
                return AppLocalizations.of(context)!.password +
                    AppLocalizations.of(context)!.minLineRequired;
              }
              if (value != null && value.length > 10) {
                return AppLocalizations.of(context)!.password +
                    AppLocalizations.of(context)!.maxLineRequired;
              }
              return null;
            },
            onSaved: (String? value) {
              map["password"] = value!;
            },
          ),
          SizedBox(
            height: 28,
          ),
          _button(),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _button() {
    return StoreObserver(
      builder: (GameStore _gameStore, BuildContext context) {
        return InkWell(
          onTap: () async {
            formKey.currentState!.save();
            if (formKey.currentState!.validate() && !_gameStore.isLoading) {
              FocusScope.of(context).requestFocus(new FocusNode());
              try {
                await _gameStore.login(body: map);
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              } catch (e) {
                final snackBar = SnackBar(
                  content:
                      Text(AppLocalizations.of(context)!.invalidCredentials),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: _gameStore.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    AppLocalizations.of(context)!.signIn,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      },
    );
  }

  InputDecoration _fieldInputDecoration(
    BuildContext context, {
    required String hintText,
  }) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 0,
      ),
      hintText: hintText,
      labelText: hintText,
      hintStyle: TextStyle(
        // color: primaryColor,
        fontSize: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
