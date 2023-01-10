import 'package:collection/collection.dart';
import '../models/processo.dart';
import 'scheduler.dart';

class FilaSRT {
  static void init() {
    QueueList<Processo> filaPronto = QueueList<Processo>();

    filaPronto.add(Processo(
      id: 1,
      tempoRajada: 8,
      interrompe: true,
      prioridade: 0,
      estado: "pronto",
      tempoChegada: 0,
      tempoCPU: 0,
      tempoRetorno: 0,
    ));

    filaPronto.add(Processo(
      id: 2,
      tempoRajada: 3,
      interrompe: true,
      prioridade: 0,
      estado: "pronto",
      tempoChegada: 0,
      tempoCPU: 0,
      tempoRetorno: 0,
    ));

    SchedulerSRT.srt(filaPronto);
  }
}
