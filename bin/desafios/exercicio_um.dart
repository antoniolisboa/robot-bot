class Count {
  String question;
  bool isThisACountQuestion = false;
  String robotBot = 'RobotBot:\n';

  Count({required this.question});

  bool isThisCount() {
    if (question.contains(RegExp('(C|c)ont(e|ar)'))) {
      isThisACountQuestion = true;
    }
    return isThisACountQuestion;
  }

  Future countToAsync() async {
    print('$robotBot Contador assíncrono');
    int value = 1;
    try {
      String? str = RegExp('[1-9]([0-9])*').stringMatch(question);
      if (str != null) value = int.parse(str);
    } catch (e) {
      print('Valor inválido para contagem!');
    }

    int i = 1;
    while (i <= value) {
      await Future.delayed(Duration(seconds: 1));
      print('                   ${i++}');
    }
  }

  void countToSync() {
    print('$robotBot Contador síncrono');
    int value = 1;
    try {
      String? str = RegExp('[1-9]([0-9])*').stringMatch(question);
      if (str != null) value = int.parse(str);
    } catch (e) {
      print('Valor inválido para contagem!');
    }

    int i = 1;
    while (i <= value) {
      print('                   ${i++}');
    }
  }
}
