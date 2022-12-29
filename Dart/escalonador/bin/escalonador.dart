import '../fcfs/services/fcfs-service.dart';
import '../sjf/services/sjf-service.dart';
import '../models/processo.dart';

void main(List<String> arguments) {
  Processo p1 = new Processo("Processo 1", 4, true, 0);
  Processo p2 = new Processo("Processo 2", 5, false, 0);
  Processo p3 = new Processo("Processo 3", 7, false, 0);

  FcfsService serviceFCFS = new FcfsService();
  //serviceFCFS.fcfs(p1, p2, p3);

  SjfService serviceSjf = new SjfService();
  serviceSjf.sjf(p1, p2, p3);
}
