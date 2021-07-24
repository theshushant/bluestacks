import 'dart:developer';

import 'package:bluestacks_assignment/utils/globals.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BluestacksAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 14,
              ),
              child: Icon(
                Icons.menu_sharp,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Flyingwolf',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
