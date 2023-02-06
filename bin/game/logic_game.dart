import 'dart:math';

class LogicGame {
  String question;
  String robotBot = 'RobotBot:';
  bool isThisLogicGame = false;

  LogicGame({required this.question});

  bool isThisLogicGameInput() {
    if (RegExp('((P|p)(edra)|(apel))|((T|t)esoura)').hasMatch(question)) {
      isThisLogicGame = true;
    }
    return isThisLogicGame;
  }

  Future logicGameAnswar() async {
    List<String> moves = [
      'Papel',
      'Tesoura',
      'Pedra',
      'Hadouken',
    ];

    int rand = Random().nextInt(moves.length);

    print('$robotBot ${moves[rand]}');

    await Future.delayed(Duration(seconds: 2));

    logicGameWinner(moves[rand]);
  }

  void logicGameWinner(moveBot) {
    if (RegExp('(P|p)edra').hasMatch(question)) {
      if (moveBot == 'Tesoura') {
        print('$robotBot (-_-) Você Ganhou!');
      } else {
        print('$robotBot (°O°) Eu Ganhei Otário!');
      }
    } else if (RegExp('(P|p)apel').hasMatch(question)) {
      if (moveBot == 'Pedra') {
        print('$robotBot (-_-) Você Ganhou!');
      } else {
        print('$robotBot (°O°) Eu Ganhei Otário!');
      }
    } else if (RegExp('(T|t)esoura').hasMatch(question)) {
      if (moveBot == 'Papel') {
        print('$robotBot (-_-) Você Ganhou!');
      } else {
        print('$robotBot (°O°) Eu Ganhei Otário!');
      }
    }
  }
}
