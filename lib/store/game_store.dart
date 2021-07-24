import 'package:bluestacks_assignment/model/game.dart';
import 'package:bluestacks_assignment/model/user.dart';
import 'package:bluestacks_assignment/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'game_store.g.dart';

class GameStore = _GameStore with _$GameStore;

abstract class _GameStore with Store {
  @observable
  ObservableList<Game> gameList = ObservableList<Game>();

  @observable
  late User authUser;

  @observable
  String? currentCursor;

  @observable
  bool isLoading = false;

  @observable
  bool isAllFetched = false;

  @action
  Future<void> fetchGameList() async {
    try {
      isLoading = true;
      Map<String, dynamic> response =
          await gameService.fetchGameList(cursor: currentCursor);
      currentCursor = response["cursor"];
      if (response["games"].isEmpty) {
        isAllFetched = true;
      }
      gameList.addAll(response["games"]);
      print("in store " + gameList.length.toString());
      isLoading = false;
    } catch (e) {
      isLoading = false;
      throw e;
    }
  }

  @action
  Future<void> login({required Map<String, String> body}) async {
    try {
      isLoading = true;
      User user = new User(
        password: body["password"]!,
        userName: body["user_name"]!,
      );
      if ((user.userName == "9898989898" || user.userName == "9876543210") &&
          user.password == "123") {
        await preferenceService.setAuthUser(user);
      } else {
        throw Error();
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      preferenceService.reset();
      throw e;
    }
  }
}
