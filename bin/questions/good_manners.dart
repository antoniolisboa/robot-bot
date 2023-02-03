class GoodManners {
  String question;
  bool isThisGoodManners = false;
  String robotBot = 'RobotBot:\n';

  GoodManners({required this.question});

  bool isThisManners() {
    if (question.contains('oi') ||
        question.contains('ola') ||
        question.contains('Oi') ||
        question.contains('Ola') ||
        question.contains('obrigado') ||
        question.contains('Obrigado') ||
        question.contains('obrigada') ||
        question.contains('Obrigado') ||
        question.contains('bom') ||
        question.contains('boa') ||
        question.contains('Bom') ||
        question.contains('Boa') ||
        question.contains('tarde') ||
        question.contains('noite') ||
        question.contains('de nada') ||
        question.contains('De nada')) {
      isThisGoodManners = true;
    }
    return isThisGoodManners;
  }

  void goodManners() {
    if (question.contains(RegExp('(B|b)om dia'))) {
      print('$robotBot Bom dia Flor do dia!');
    } else if (question.contains(RegExp('(B|b)oa tarde'))) {
      print('$robotBot Opa sô, boa tarde!');
    } else if (question.contains(RegExp('(B|b)oa noite'))) {
      print('$robotBot Boa noite tchê!');
    } else if (question.contains(RegExp('(O|o)(i|la)'))) {
      print('$robotBot Muito prazer!');
    } else if (question.contains(RegExp('(O|o)brigad(o|a)'))) {
      print('$robotBot De nada, fique a vontade C:');
    }
  }
}
