// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import '../../models/processo_srt.dart';
import 'srt_service.dart';

class QueueSRT {
  static void srtQueue() {
    ProcessoSRT p1 = ProcessoSRT(
      name: 'Processo 1',
      burstTime: 2,
      hasInterruption: true,
      timeSpent: 0,
      returnTime: 0,
      arrivalTime: 0,
    );
    ProcessoSRT p2 = ProcessoSRT(
      name: 'Processo 2',
      burstTime: 5,
      hasInterruption: true,
      timeSpent: 0,
      returnTime: 0,
      arrivalTime: 6,
    );
    ProcessoSRT p3 = ProcessoSRT(
      name: 'Processo 3',
      burstTime: 7,
      hasInterruption: true,
      timeSpent: 0,
      returnTime: 0,
      arrivalTime: 2,
    );

    QueueList<ProcessoSRT> readyQueue = QueueList<ProcessoSRT>();

    readyQueue.add(p1);
    readyQueue.add(p2);
    readyQueue.add(p3);

    print('\nIniciando escalonador SRT..');
    SrtService serviceSRT = SrtService();
    serviceSRT.srt(readyQueue);
  }
}
