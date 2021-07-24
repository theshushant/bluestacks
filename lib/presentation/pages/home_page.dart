import 'package:bluestacks_assignment/presentation/components/bluestacks_appbar.dart';
import 'package:bluestacks_assignment/presentation/components/profile_section.dart';
import 'package:bluestacks_assignment/presentation/components/recommend_section/game_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static const String routeName ="HomePage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              BluestacksAppbar(),
              _body(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 14,
        ),
        child: Column(
          children: [
            ProfileSection(),
            SizedBox(height: 20),
            Expanded(
              child: GameList(),
            ),
          ],
        ),
      ),
    );
  }
}
