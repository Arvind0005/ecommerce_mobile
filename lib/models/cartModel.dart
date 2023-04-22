Stream<int> generateNumbers = (() async* {
  await Future<void>.delayed(Duration(milliseconds: 2));

  for (int i = 1; i <= 5; i++) {
    await Future<void>.delayed(Duration(milliseconds: 1));
    yield i;
  }
})();
