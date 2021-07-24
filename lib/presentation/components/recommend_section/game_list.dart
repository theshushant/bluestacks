import 'package:bluestacks_assignment/presentation/components/recommend_section/game_card.dart';
import 'package:bluestacks_assignment/presentation/custom/store_observer.dart';
import 'package:bluestacks_assignment/store/game_store.dart';
import 'package:bluestacks_assignment/utils/globals.dart';
import 'package:bluestacks_assignment/utils/string_value.dart';
import 'package:flutter/material.dart';

class GameList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringValue.recommendTag,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: titleSize,
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: _body(),
        )
      ],
    );
  }

  Widget _body() {
    return StoreObserver(builder: (GameStore _gameStore, BuildContext context) {
      if (!_gameStore.isLoading && _gameStore.gameList.isEmpty) {
        _gameStore.fetchGameList();
      }
      if (_gameStore.isLoading && _gameStore.gameList.isEmpty) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
        itemCount: _gameStore.gameList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == _gameStore.gameList.length - 1 &&
              !_gameStore.isLoading &&
              !_gameStore.isAllFetched) {
            postCalls(() {
              _gameStore.fetchGameList();
            });
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GameCard(game: _gameStore.gameList[index]),
              (index == _gameStore.gameList.length - 1) &&
                      !_gameStore.isAllFetched
                  ? Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          );
        },
      );
    });
  }
}
