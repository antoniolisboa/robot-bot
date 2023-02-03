class BotClock {
  Future clock({required int seconds}) {
    return Future.delayed(Duration(seconds: seconds));
  }

  Stream timeToCloseBot({required int interval, int? maxCount}) async* {
    int i = 0;
    while (true) {
      await Future.delayed(Duration(seconds: interval));
      yield i++;
      if (i == maxCount) break;
    }

    print('A Stream terminou.');
  }
}
