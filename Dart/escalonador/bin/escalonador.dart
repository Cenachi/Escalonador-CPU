import '../fcfs/services/fcfs_service.dart';
import '../sjf/services/sjf_service.dart';
import '../models/processo.dart';
import '../srt/services/srt_service.dart';

void main(List<String> arguments) {
  Processo p1 = Processo("Processo 1", 4, true, 0, 0);
  Processo p2 = Processo("Processo 2", 10, false, 0, 0);
  Processo p3 = Processo("Processo 3", 17, false, 0, 0);

  //print('\nIniciando escalonador FCFS..');
  FcfsService serviceFCFS = FcfsService();
  //serviceFCFS.fcfs(p1, p2, p3);

  //print('\nIniciando escalonador SJF..');
  SjfService serviceSJF = SjfService();
  //serviceSJF.sjf(p1, p2, p3);

  print('\nIniciando escalonador SRT..');
  SrtService serviceSRT = SrtService();
  serviceSRT.srt(p1, p2, p3);
}
