import 'dart:async';
import 'dart:io';

import 'desafios/my_knowledge.dart';
import 'questions/good_manners.dart';
import 'questions/math_questions.dart';
import 'questions/time_questions.dart';
import 'questions/world_domination.dart';
import 'timing/waiting_time.dart';
import 'desafios/exercicio_um.dart';

void main() async {
  String robotBot = 'RobotBOT:\n';
  var loop = true;
  String usuario = '';
  Stream closeBot = BotClock().timeToCloseBot(interval: 1, maxCount: 10);
  StreamSubscription countdownToClose = closeBot.listen(
    (event) {
      print('                       RobotBot está ativo a $event segundos.');
    },
    onDone: () {
      loop = false;
      print('RobotBot está sendo finalizado! Faça sua última pergunta!');
    },
  );

  MyKnowledge.myKowledgeRandom().listen(
    (event) => print(event),
    onError: (e) => print(e),
  );

  print('-- Iniciando o RobotBot, aguarde..--');
  await BotClock().clock(seconds: 2);
  print('RobotBot:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(seconds: 1);
    if (usuario.contains(RegExp('((X|x)au)|((A|a)deus)'))) {
      loop = false;
      print(robotBot + ' Até a proxima!!');
      countdownToClose.cancel();
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      await BotClock().clock(seconds: 2);
      TimeQuestions(usuario).timeQuestion();
    } else if (GoodManners(question: usuario).isThisManners()) {
      GoodManners(question: usuario).goodManners();
    } else if (Count(question: usuario).isThisCount()) {
      countdownToClose.pause();
      await Count(question: usuario).countToAsync();
      Count(question: usuario).countToSync();
      countdownToClose.resume();
    } else if (MathQuestions(question: usuario).isThisMath()) {
      MathQuestions(question: usuario).mathQuestion();
    } else if (MyKnowledge(question: usuario).isThisAboutKnowledge()) {
      MyKnowledge(question: usuario).myKnowledgeQuestion();
    } else if (WorldDomination(question: usuario)
        .isThisWorldDominationQuestion()) {
      countdownToClose.pause();
      await WorldDomination(question: usuario)
          .worldDominationQuestion()
          .then((value) => print(value));
      countdownToClose.resume();
    } else {
      await BotClock().clock(seconds: 2);
      print(robotBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(robotBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (loop);

  print('--Encerrando robotBot--');
}
