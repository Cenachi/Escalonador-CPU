import 'package:collection/collection.dart';
import 'dart:io';
import 'dart:math';
import '../../models/processo.dart';

class SjfService {
  Random random = Random();
  QueueList<Processo> readyQueue = QueueList<Processo>();

  void sjf(Processo p1, Processo p2, Processo p3) {
    readyQueue.add(p1);
    readyQueue.add(p2);
    readyQueue.add(p3);

    readyQueue.sort(((a, b) => a.getTime.compareTo(b.getTime)));

    //Implementar ociosidade..
    while (readyQueue.isNotEmpty) {
      Processo p = readyQueue.removeFirst();
      readyQueue.sort(((a, b) => a.getTime.compareTo(b.getTime)));

      if (p.getInterrupted) {
        int interrupted = random.nextInt(p.getTime);

        for (int i = 0; i < interrupted; i++) {
          stdout.write('\r${p.getName} em: $i s');
          sleep(Duration(seconds: 1));
        }

        readyQueue.add(Processo(p.getName, p.getTime, false, interrupted, 0));
      } else {
        for (int i = p.getTimeSpent; i <= p.getTime; i++) {
          stdout.write('\r${p.getName} em: $i s');
          sleep(Duration(seconds: 1));
        }
      }
      print('');
    }
  }
}
