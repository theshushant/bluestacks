import 'dart:convert';

import 'package:bluestacks_assignment/model/game.dart';
import 'package:dio/dio.dart';

class GameService {
  GameService._();

  factory GameService.getInstance() => _instance;
  static final GameService _instance = GameService._();

  Future<Map<String,dynamic>> fetchGameList({String? cursor}) async {
    Map<String, dynamic> response = json.decode((await Dio().get(
      'http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all',
      queryParameters: {
        "cursor": cursor,
      },
    ))
        .toString());
    List<Game> games = <Game>[];

    response["data"]["tournaments"].forEach((element) {
      games.add(Game.fromJson(element));
    });
    Map<String, dynamic> output = {
      "cursor": response["data"]["cursor"],
      "games": games,
    };

    return output;
  }
}
