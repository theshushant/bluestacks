import 'dart:math';

import 'package:bluestacks_assignment/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/73/16/f5/7316f550de9ca0045e3d8d98a5bb5e44.png',
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Simon Baker',
                    style: TextStyle(
                      fontSize: mediumSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${_getRandomNumber()}00',
                          style: TextStyle(
                            fontSize: mediumSize,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(AppLocalizations.of(context)!.rating),
                        SizedBox(width: 8),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _descriptionBox(
                '${_getRandomNumber()}',
                AppLocalizations.of(context)!.tournamentPlayed,
                Colors.orange,
                Colors.orangeAccent,
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            SizedBox(width: 1.5),
            Expanded(
              child: _descriptionBox(
                '${_getRandomNumber()}',
                AppLocalizations.of(context)!.tournamentWon,
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ),
            ),
            SizedBox(width: 1.5),
            Expanded(
              child: _descriptionBox(
                '26%',
                AppLocalizations.of(context)!.winningPercentage,
                Colors.red,
                Colors.deepOrangeAccent,
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            )
          ],
        )
      ],
    );
  }

  int _getRandomNumber() {
    Random random = new Random();
    return random.nextInt(100);
  }

  Widget _descriptionBox(
    String number,
    String title,
    Color color1,
    Color color2, {
    Radius topLeft = Radius.zero,
    Radius topRight = Radius.zero,
    Radius bottomLeft = Radius.zero,
    Radius bottomRight = Radius.zero,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
        borderRadius: BorderRadius.only(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontSize: mediumSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                // fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
