class MyKnowledge {
  String question;
  String robotBot = 'RobotBot:';
  bool isThisAboutMyKnowledge = false;

  MyKnowledge({required this.question});

  bool isThisAboutKnowledge() {
    if (RegExp('(S|s)abe(r?)').hasMatch(question)) {
      isThisAboutMyKnowledge = true;
    }
    return isThisAboutMyKnowledge;
  }

  void myKnowledgeQuestion() {
    if (!RegExp('(O|o) que vo?c(ê|e)? sabe?').hasMatch(question)) {
      print('$robotBot acho que vc quer saber as coisas que eu sei.');
    }

    print('$robotBot Sei muitas coisas:');
    print('$robotBot Como dizer as horas, o dia e o ano.');
    print('$robotBot Sei boas maneira, pois sou muito educado ^-^');
    print('$robotBot Consigo fazer operações matemática simples, '
        'tipo 1+1 = 3 ;)');
    print('$robotBot Por fim consigo contar até um valor desejado.');
    print('EU SOU O BICHÃO MEMO HAHAHAHAH');
  }
}
