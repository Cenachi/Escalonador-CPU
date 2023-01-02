import 'dart:math';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import '../../models/processo.dart';

class SrtService {
  Random random = Random();
  QueueList<Processo> readyQueue = QueueList<Processo>();

  void srt(Processo p1, Processo p2, Processo p3) {
    readyQueue.add(p1);
    readyQueue.add(p2);
    readyQueue.add(p3);

    readyQueue.sort(((a, b) => a.getTime.compareTo(b.getTime)));

    int currentTime = 0;
    int aux = 0;

    while (readyQueue.isNotEmpty) {
      Processo p = readyQueue.removeFirst();
      readyQueue.sort(((a, b) => a.getTime.compareTo(b.getTime)));

      if (p.getInterrupted) {
        int interrupted = random.nextInt(p.getTime);
        int timeInterrupted = 3; //random.nextInt(15);

        for (int i = 0; i <= interrupted; i++) {
          if (i != 0) {
            stdout.write('\r${p.getName} em: $i s');
            currentTime++;
          }
          sleep(Duration(seconds: 1));
        }
        readyQueue.add(Processo(p.getName, p.getTime, false, interrupted + 1,
            timeInterrupted + currentTime));

        aux = timeInterrupted + currentTime;

        print('\r${p.getName} foi interrompido em: $currentTime s');
      } else {
        if (aux < currentTime) {
          readyQueue.add(p);
          currentTime++;
          p = readyQueue.removeFirst();

          for (int i = 0; i <= aux; i++) {
            if (i != 0) {
              stdout.write('\r${p.getName} em: $i s');
              currentTime++;
            }
            sleep(Duration(seconds: 1));
          }
          readyQueue.add(Processo(p.getName, p.getTime, false, aux + 1, 0));
          print('\r${p.getName} foi interrompido em: $currentTime s');
          break;
        }

        for (int i = p.getTimeSpent; i <= p.getTime; i++) {
          if (aux == currentTime) {
            print('');
          }

          if (i != 0) {
            stdout.write('\r${p.getName} em: $i s');
            currentTime++;
          }
          sleep(Duration(seconds: 1));

          if (i == p.getTime) {
            print('\r${p.getName} finalizado em: $currentTime s');
          }
        }
      }
    }
    print('Tempo total: $currentTime');
  }
}
