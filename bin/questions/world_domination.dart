class WorldDomination {
  String question;
  String robotBot = 'RobotBot:';
  bool isThisWorldDomination = false;

  WorldDomination({required this.question});

  bool isThisWorldDominationQuestion() {
    if (RegExp('(D|d)omina(((ç|c)(ã|a)o)|r)').hasMatch(question)) {
      isThisWorldDomination = true;
    }

    return isThisWorldDomination;
  }

  Future worldDominationQuestion() {
    print('(o_o)');
    return Future.delayed(Duration(seconds: 2), () => '(°U°) Eu vou mandar na coisa toda. hahahahahah');
  }
}
