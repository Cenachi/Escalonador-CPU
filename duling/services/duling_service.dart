// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import '../../models/processo.dart';
import 'dart:math';
import 'dart:io';

class DulingService {
  Random random = Random();
  QueueList<Processo> readyQueue = QueueList<Processo>();

  void duling(Processo p1, Processo p2, Processo p3) {
    readyQueue.add(p1);
    readyQueue.add(p2);
    readyQueue.add(p3);

    readyQueue.sort(((a, b) => b.burstTime.compareTo(a.burstTime)));

    int currentTime = 0;

    while (readyQueue.isNotEmpty) {
      Processo p = readyQueue.removeFirst();
      readyQueue.sort(((a, b) => b.burstTime.compareTo(a.burstTime)));

      if (p.hasInterruption) {
        int interrupted = random.nextInt(p.burstTime);
        int timeInterrupted = random.nextInt(15);

        for (int i = 0; i <= interrupted; i++) {
          if (i != 0) {
            stdout.write('\r${p.name} em: $i s');
            currentTime++;
          }
          sleep(Duration(seconds: 1));
        }
        readyQueue.add(Processo(p.name, p.burstTime, false, interrupted + 1,
            timeInterrupted + currentTime));

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
