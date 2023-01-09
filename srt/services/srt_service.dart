// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'dart:math';
import '../../models/processo_srt.dart';

class SrtService {
  Random random = Random();

  void srt(QueueList<ProcessoSRT> readyQueue) {
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
