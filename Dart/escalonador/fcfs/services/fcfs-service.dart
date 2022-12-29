import 'dart:collection';
import 'dart:io';
import 'dart:math';
import '../../models/processo.dart';

class FcfsService {
  Queue<Processo> readyQueue = new Queue<Processo>();
  Random random = new Random();

  void fcfs(Processo p1, Processo p2, Processo p3) {
    readyQueue.add(p1);
    readyQueue.add(p2);
    readyQueue.add(p3);

    while (!readyQueue.isEmpty) {
      Processo p = readyQueue.removeFirst();

      if (p.getInterrupted) {
        int interrupted = random.nextInt(p.getTime);

        for (int i = 0; i < interrupted; i++) {
          stdout.write('\r${p.getName} em: ${i} s');
          sleep(Duration(seconds: 1));
        }

        readyQueue.add(new Processo(p.getName, p.getTime, false, interrupted));
      } else {
        for (int i = p.getTimeSpent; i <= p.getTime; i++) {
          stdout.write('\r${p.getName} em: ${i} s');
          sleep(Duration(seconds: 1));
        }
      }
      print('');
    }
  }
}
