import 'package:bluestacks_assignment/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BluestacksAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 14,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 14
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () async {
            },
            child: Icon(
              Icons.menu_sharp,
            ),
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.title,
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
