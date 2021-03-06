// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameStore on _GameStore, Store {
  final _$gameListAtom = Atom(name: '_GameStore.gameList');

  @override
  ObservableList<Game> get gameList {
    _$gameListAtom.reportRead();
    return super.gameList;
  }

  @override
  set gameList(ObservableList<Game> value) {
    _$gameListAtom.reportWrite(value, super.gameList, () {
      super.gameList = value;
    });
  }

  final _$authUserAtom = Atom(name: '_GameStore.authUser');

  @override
  User get authUser {
    _$authUserAtom.reportRead();
    return super.authUser;
  }

  @override
  set authUser(User value) {
    _$authUserAtom.reportWrite(value, super.authUser, () {
      super.authUser = value;
    });
  }

  final _$currentCursorAtom = Atom(name: '_GameStore.currentCursor');

  @override
  String? get currentCursor {
    _$currentCursorAtom.reportRead();
    return super.currentCursor;
  }

  @override
  set currentCursor(String? value) {
    _$currentCursorAtom.reportWrite(value, super.currentCursor, () {
      super.currentCursor = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_GameStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isAllFetchedAtom = Atom(name: '_GameStore.isAllFetched');

  @override
  bool get isAllFetched {
    _$isAllFetchedAtom.reportRead();
    return super.isAllFetched;
  }

  @override
  set isAllFetched(bool value) {
    _$isAllFetchedAtom.reportWrite(value, super.isAllFetched, () {
      super.isAllFetched = value;
    });
  }

  final _$fetchGameListAsyncAction = AsyncAction('_GameStore.fetchGameList');

  @override
  Future<void> fetchGameList() {
    return _$fetchGameListAsyncAction.run(() => super.fetchGameList());
  }

  final _$loginAsyncAction = AsyncAction('_GameStore.login');

  @override
  Future<void> login({required Map<String, String> body}) {
    return _$loginAsyncAction.run(() => super.login(body: body));
  }

  @override
  String toString() {
    return '''
gameList: ${gameList},
authUser: ${authUser},
currentCursor: ${currentCursor},
isLoading: ${isLoading},
isAllFetched: ${isAllFetched}
    ''';
  }
}
