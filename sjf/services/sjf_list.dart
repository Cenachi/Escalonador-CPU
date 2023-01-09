// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import '../../models/processo.dart';
import 'sjf_service.dart';

class QueueSJF {
  static void sjfQueue() {
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

    QueueList<Processo> readyQueue = QueueList<Processo>();

    readyQueue.add(p1);
    readyQueue.add(p2);
    readyQueue.add(p3);

    print('\nIniciando escalonador SJF..');

    SjfService serviceSJF = SjfService();
    serviceSJF.sjf(readyQueue);
  }
}
