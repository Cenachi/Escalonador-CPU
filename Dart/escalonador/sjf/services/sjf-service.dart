import 'package:collection/collection.dart';
import 'dart:collection';
import 'dart:io';
import 'dart:math';
import '../../models/processo.dart';

class SjfService {
  Random random = new Random();
  QueueList<Processo> readyQueue = new QueueList<Processo>();

  void sjf(Processo p1, Processo p2, Processo p3) {
    // final readyQueue = PriorityQueue<Processo>((a, b) => a.getTime.compareTo(b.getTime));

    readyQueue.add(p1); //while (readyQueue.isNotEmpty) {
    readyQueue.add(p2); //   print('* ${readyQueue.removeFirst().getName}');
    readyQueue.add(p3); //  }

    final sortedQueue = readyQueue.sort(((a, b) => a.getTime.compareTo(b.getTime)));

    while (!readyQueue.isEmpty) {
      Processo p = readyQueue.removeFirst();
      final sortedQueue = readyQueue.sort(((a, b) => a.getTime.compareTo(b.getTime)));

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
