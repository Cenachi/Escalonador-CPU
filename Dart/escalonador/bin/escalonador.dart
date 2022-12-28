import '../fcfs/controller/processoController.dart';
import '../fcfs/models/processo.dart';

void main(List<String> arguments) {
  Processo p1 = new Processo("Processo 1", 4, true, 0);
  Processo p2 = new Processo("Processo 2", 5, false, 0);
  Processo p3 = new Processo("Processo 3", 7, false, 0);

  ProcessoController pController = new ProcessoController();
  pController.fcfs(p1, p2, p3);
}
