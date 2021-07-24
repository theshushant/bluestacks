import 'dart:convert';

import 'package:bluestacks_assignment/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  PreferenceService._();

  factory PreferenceService.getInstance() => _instance;

  static final PreferenceService _instance = PreferenceService._();

  static const String TOKEN = 'token';

  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  Future<void> setAuthUser(User user) async {
    (await _getInstance())
        .setString(PreferenceService.TOKEN, json.encode(user.toJson()));
  }

  Future<User?> getAuthUser() async {
    final String? token =
        (await _getInstance()).getString(PreferenceService.TOKEN);
    return token != null && token.isNotEmpty
        ? User.fromJson(json.decode(token))
        : null;
  }

  Future<void> reset() async {
    (await _getInstance()).setString(PreferenceService.TOKEN, '');
  }
}
