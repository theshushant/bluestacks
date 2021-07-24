// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    gameName: json['game_name'] as String,
    name: json['name'] as String,
    coverUrl: json['cover_url'] as String?,
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'name': instance.name,
      'cover_url': instance.coverUrl,
      'game_name': instance.gameName,
    };
