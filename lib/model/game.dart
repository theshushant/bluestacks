import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game {
  final String name;

  @JsonKey(name: 'cover_url')
  final String? coverUrl;

  @JsonKey(name: 'game_name')
  final String gameName;

  Game({
    this.gameName = "",
    this.name = "",
    this.coverUrl,
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
