class MathQuestions {
  String question;
  bool isThisAMathQuestion = false;
  String robotBot = 'RobotBot:';

  MathQuestions({required this.question});

  bool isThisMath() {
    if (RegExp('[+]|[-]|[*]|[/]').hasMatch(question)) {
      isThisAMathQuestion = true;
    }
    return isThisAMathQuestion;
  }

  void mathQuestion() {
    double result = 0;
    String? expression =
        RegExp('[0-9]+([+]|[-]|[*]|[/])[0-9]+').firstMatch(question)?[0];
    if (expression != null) {
      if (expression[1] == '+') {
        result = double.parse(expression[0]) + double.parse(expression[2]);
      } else if (expression[1] == '-') {
        result = double.parse(expression[0]) - double.parse(expression[2]);
      } else if (expression[1] == '*') {
        result = double.parse(expression[0]) * double.parse(expression[2]);
      } else if (expression[1] == '/') {
        result = double.parse(expression[0]) / double.parse(expression[2]);
      }

      if (question.contains(RegExp('(Q|q)uanto'))) {
        print('$expression é $result ;)');
      } else {
        print('$robotBot $result');
      }
    } else {
      print('$robotBot Não consegui entender sua operação matemática.');
    }
  }
}
