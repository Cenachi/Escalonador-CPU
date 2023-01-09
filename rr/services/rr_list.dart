import 'dart:collection';
import '../../models/processo.dart';
import 'rr_services.dart';

class QueueRR {
  static void rrQueue() {
    Processo p1 = Processo(
      name: "Processo 1",
      burstTime: 4,
      hasInterruption: true,
      timeSpent: 0,
      returnTime: 0,
    );
    Processo p2 = Processo(
      name: "Processo 2",
      burstTime: 5,
      hasInterruption: false,
      timeSpent: 0,
      returnTime: 0,
    );
    Processo p3 = Processo(
      name: "Processo 3",
      burstTime: 7,
      hasInterruption: true,
      timeSpent: 0,
      returnTime: 0,
    );

    Queue<Processo> readyQueue = Queue<Processo>();

    readyQueue.add(p1);
    readyQueue.add(p2);
    readyQueue.add(p3);

    print('\nIniciando escalonador RR..');

    RrService serviceRr = RrService();
    serviceRr.rr(readyQueue);
  }
}
