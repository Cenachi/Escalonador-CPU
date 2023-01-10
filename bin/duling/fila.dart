import 'package:collection/collection.dart';
import '../models/processo.dart';
import 'scheduler.dart';

class FilaDuling {
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
      interrompe: false,
      prioridade: 1,
      estado: "pronto",
      tempoChegada: 0,
      tempoCPU: 0,
      tempoRetorno: 0,
    ));

    filaPronto.add(Processo(
      id: 3,
      tempoRajada: 3,
      interrompe: false,
      prioridade: -5,
      estado: "pronto",
      tempoChegada: 0,
      tempoCPU: 0,
      tempoRetorno: 0,
    ));

    SchedulerDuling.duling(filaPronto);
  }
}
