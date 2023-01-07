import 'dart:collection';
//import 'dart:io';
import 'dart:math';
import '../../models/processo.dart';

class RrService {
  Queue<Processo> readyQueue = Queue<Processo>();
  Random random = Random();

  void rr(Processo p1, Processo p2, Processo p3) {
    readyQueue.add(p1);
    readyQueue.add(p2);
    readyQueue.add(p3);

    int currentTime = 0;

    while (readyQueue.isNotEmpty) {}
    print('Tempo total: $currentTime');
  }
}
