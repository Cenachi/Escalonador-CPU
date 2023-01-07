import 'dart:math';
//import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import '../../models/processo_srt.dart';

class SrtService {
  Random random = Random();
  QueueList<ProcessoSRT> readyQueue = QueueList<ProcessoSRT>();

  void srt(ProcessoSRT p1, ProcessoSRT p2, ProcessoSRT p3) {
    readyQueue.add(p1);
    readyQueue.add(p2);
    //readyQueue.add(p3);

    readyQueue.sort(((a, b) => a.burstTime.compareTo(b.burstTime)));

    int currentTime = 0;
    int aux = 0;

    while (readyQueue.isNotEmpty) {
      readyQueue.sort(((a, b) =>
          (a.burstTime - a.timeSpent).compareTo(b.burstTime - b.timeSpent)));

      ProcessoSRT p = readyQueue.removeFirst();

      //Se o primeiro processo parar, o tempo q ele ficar parado, o segundo com menor tempo executa
      //ai quando o processo q ta parado terminar o tempo de ocioso, tem que parar o que ta rodando
      //e executa-lo novamente

    }
    print('Tempo total: $currentTime');
  }
}
