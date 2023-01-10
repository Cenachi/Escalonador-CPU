import 'package:collection/collection.dart';
import '../models/processo.dart';

class Dispatcher {
  QueueList<Processo> fila = QueueList<Processo>();

  Dispatcher(this.fila);

  set setFila(QueueList<Processo> newFila) {
    this.fila = newFila;
  }

  addProcess(Processo process) {
    this.fila.add(process);
  }

  Processo getProcess() {
    return this.fila.removeFirst();
  }

  Processo getProcessSJF() {
    this.fila.sort(((a, b) => a.tempoRajada.compareTo(b.tempoRajada)));
    return this.fila.removeFirst();
  }

  //Procura um processo que já tenha chegado e não esteja interrompido.
  Processo getProcessSRT(int tempoAtual) {
    this.fila.sort(((a, b) =>
        (a.tempoRajada - a.tempoCPU).compareTo(b.tempoRajada - b.tempoCPU)));

    for (int i = 0; i < this.fila.length; i++) {
      if (this.fila[i].tempoChegada < tempoAtual &&
          this.fila[i].tempoRetorno <= tempoAtual) {
        return this.fila.removeAt(i);
      }
    }
    //Ou retorna o primeiro da this.fila
    return this.fila.removeFirst();
  }

  //Procura um processo mais rapido que já tenha chegado e não esteja interrompido
  Processo getMenorProcessSRT(
      Processo processoAtual, int tempoAtual, int tempoProcesso) {
    this.fila.sort(((a, b) =>
        (a.tempoRajada - a.tempoCPU).compareTo(b.tempoRajada - b.tempoCPU)));

    for (int i = 0; i < this.fila.length; i++) {
      if (this.fila[i].tempoChegada < tempoAtual &&
          this.fila[i].tempoRajada - this.fila[i].tempoCPU <
              processoAtual.tempoRajada - processoAtual.tempoCPU &&
          this.fila[i].tempoRetorno <= tempoAtual) {
        print(
            'Processo ${processoAtual.id} interrompido pelo processo ${this.fila[i].id}');

        addProcess(Processo(
          id: processoAtual.id,
          tempoRajada: processoAtual.tempoRajada,
          interrompe: false,
          prioridade: processoAtual.prioridade,
          estado: processoAtual.estado,
          tempoChegada: processoAtual.tempoChegada,
          tempoCPU: tempoProcesso,
          tempoRetorno: processoAtual.tempoRetorno,
        ));

        return this.fila.removeAt(i);
      }
    }
    return processoAtual;
  }

  Processo getProcessDuling(int tempoAtual) {
    this.fila.sort(((a, b) => a.prioridade.compareTo(b.prioridade)));

    for (int i = 0; i < this.fila.length; i++) {
      if (this.fila[i].tempoChegada < tempoAtual &&
          this.fila[i].tempoRetorno <= tempoAtual) {
        return this.fila.removeAt(i);
      }
    }
    //Ou retorna o primeiro da this.fila
    return this.fila.removeFirst();
  }

  Processo getMenorPrioridade(
      Processo processoAtual, int tempoAtual, int tempoProcesso) {
    this.fila.sort(((a, b) =>
        (a.tempoRajada - a.tempoCPU).compareTo(b.tempoRajada - b.tempoCPU)));

    for (int i = 0; i < this.fila.length; i++) {
      if (this.fila[i].tempoChegada < tempoAtual &&
          this.fila[i].prioridade < processoAtual.prioridade &&
          this.fila[i].tempoRetorno <= tempoAtual) {
        print(
            'Processo ${processoAtual.id} interrompido pelo processo ${this.fila[i].id}');

        addProcess(Processo(
          id: processoAtual.id,
          tempoRajada: processoAtual.tempoRajada,
          interrompe: processoAtual.interrompe,
          prioridade: processoAtual.prioridade,
          estado: processoAtual.estado,
          tempoChegada: processoAtual.tempoChegada,
          tempoCPU: tempoProcesso,
          tempoRetorno: processoAtual.tempoRetorno,
        ));

        return this.fila.removeAt(i);
      }
    }
    return processoAtual;
  }
}
