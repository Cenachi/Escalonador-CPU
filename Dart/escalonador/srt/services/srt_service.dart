import 'dart:math';
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

    while (readyQueue.isNotEmpty) {
      //Ainda será implementado..
    }
  }
}
