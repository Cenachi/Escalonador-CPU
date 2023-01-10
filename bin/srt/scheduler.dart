import 'package:collection/collection.dart';
import 'dart:io';
import '../controller/dispatcher.dart';
import '../models/processo.dart';

class SchedulerSRT {
  static void srt(QueueList<Processo> filaPronto) {
    Dispatcher dispatcher = new Dispatcher(filaPronto);

    int tempoAtual = 0;

    while (dispatcher.fila.isNotEmpty) {
      Processo p = dispatcher.getProcessSRT(tempoAtual);

      if (p.tempoRetorno > tempoAtual) {
        print("esperando");
        sleep(Duration(seconds: 1));
        tempoAtual++;
        dispatcher.addProcess(p);
        continue;
      }

      if (p.tempoCPU > 0) {
        print("Retornando processo ${p.id} em: $tempoAtual");
      }

      for (int i = p.tempoCPU; i <= p.tempoRajada; i++) {
        p = dispatcher.getMenorProcessSRT(p, tempoAtual, i);
        if (i == 0) {
          print('Processo ${p.id} iniciado no momento: ${tempoAtual}s\n');
          continue;
        }

        if (p.interrompe && i == 3) {
          dispatcher.addProcess(Processo(
            id: p.id,
            tempoRajada: p.tempoRajada,
            interrompe: false,
            prioridade: p.prioridade,
            estado: "bloqueado",
            tempoChegada: p.tempoChegada,
            tempoCPU: i + 1,
            tempoRetorno: tempoAtual + 2,
          ));
          print("interrompido");
          break;
        }

        print('Tempo de execução do processo ${p.id}: ${i}s');
        sleep(Duration(seconds: 1));
        tempoAtual++;

        if (i == p.tempoRajada) {
          print('\nProcesso ${p.id} finalizado em: ${tempoAtual}s');
        }
      }

      print('');
    }

    print('Tempo total: ${tempoAtual}s');
  }
}
