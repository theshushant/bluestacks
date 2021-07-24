import 'package:bluestacks_assignment/model/game.dart';
import 'package:bluestacks_assignment/utils/globals.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  GameCard({
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height*0.1,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    game.coverUrl!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          game.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          game.gameName,
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: titleSize,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
