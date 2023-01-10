import 'package:collection/collection.dart';
import 'dart:io';
import '../controller/dispatcher.dart';
import '../models/processo.dart';

class SchedulerRR {
  static void rr(QueueList<Processo> filaPronto) {
    Dispatcher dispatcher = new Dispatcher(filaPronto);

    int tempoAtual = 0;
    int quantum = 2;

    while (dispatcher.fila.isNotEmpty) {
      Processo p = dispatcher.getProcess();

      if (p.tempoRetorno > tempoAtual) {
        print("esperando");
        sleep(Duration(seconds: 1));
        tempoAtual++;
        dispatcher.addProcess(p);
        continue;
      }

      if (p.tempoCPU > 0) {
        print("Retornando processo ${p.id}");
      }

      int contador = 0;

      for (int i = p.tempoCPU; i <= p.tempoRajada; i++) {
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
          continue;
        }
        contador++;

        if (contador == quantum) {
          dispatcher.addProcess(Processo(
            id: p.id,
            tempoRajada: p.tempoRajada,
            interrompe: p.interrompe,
            prioridade: p.prioridade,
            estado: p.estado,
            tempoChegada: p.tempoChegada,
            tempoCPU: i + 1,
            tempoRetorno: p.tempoRetorno,
          ));
          break;
        }
      }

      print('');
    }

    print('Tempo total: ${tempoAtual}s');
  }
}
