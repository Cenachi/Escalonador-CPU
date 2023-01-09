import 'dart:collection';
import 'dart:io';
import 'dart:math';
import '../../models/processo.dart';

class FcfsService {
  Random random = Random();

  void fcfs(Queue<Processo> readyQueue) {
    int currentTime = 0;

    while (readyQueue.isNotEmpty) {
      Processo p = readyQueue.removeFirst();

      if (p.hasInterruption) {
        int interrupted = random.nextInt(p.burstTime - 1) + 1;
        int timeInterrupted = random.nextInt(15);

        for (int i = 0; i <= interrupted; i++) {
          if (i != 0) {
            stdout.write('\r${p.name} em: $i s');
            currentTime++;
          }
          sleep(Duration(seconds: 1));
        }
        readyQueue.add(Processo(
          name: p.name,
          burstTime: p.burstTime,
          hasInterruption: false,
          timeSpent: interrupted + 1,
          returnTime: timeInterrupted + currentTime,
        ));

        print('\r${p.name} foi interrompido em: $currentTime s');
      } else {
        for (int i = p.timeSpent; i <= p.burstTime; i++) {
          if (p.returnTime > currentTime) {
            stdout.write('\r${p.name} está interrompido!');
            sleep(Duration(seconds: 1));
            currentTime++;
            readyQueue.add(p);
            break;
          }

          if (p.returnTime == currentTime) {
            print('');
          }

          if (i != 0) {
            stdout.write('\r${p.name} em: $i s');
            currentTime++;
          }
          sleep(Duration(seconds: 1));

          if (i == p.burstTime) {
            print('\r${p.name} finalizado em: $currentTime s');
          }
        }
      }
    }
    print('Tempo total: $currentTime');
  }
}
