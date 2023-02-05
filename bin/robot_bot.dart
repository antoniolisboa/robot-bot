import 'dart:async';
import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/time_questions.dart';
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
    } else if (Count(question: usuario).isThisCountQuestion()) {
      countdownToClose.pause();
      await Count(question: usuario).countToAsync();
      Count(question: usuario).countToSync();
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
