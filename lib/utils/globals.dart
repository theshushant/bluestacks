import 'package:bluestacks_assignment/service/game_service.dart';
import 'package:bluestacks_assignment/service/preference_service.dart';
import 'package:flutter/material.dart';


// Font Assign
double mediumSize = 16;
double titleSize = 20;

const Color primaryColor = Colors.lightBlue;
const Color whiteColor = Colors.white;


// Service Calls
GameService gameService = GameService.getInstance();
PreferenceService preferenceService = PreferenceService.getInstance();

// Global Functions

void postCalls(Function function) {
  WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    function();
  });
}