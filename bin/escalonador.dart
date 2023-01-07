import '../duling/services/duling_service.dart';
import '../fcfs/services/fcfs_service.dart';
import '../rr/services/rr_services.dart';
import '../sjf/services/sjf_service.dart';
import '../models/processo.dart';
import '../models/processo_srt.dart';
import '../srt/services/srt_service.dart';

void main(List<String> arguments) {
  Processo p1 = Processo("Processo 1", 4, true, 0, 0);
  Processo p2 = Processo("Processo 2", 6, false, 0, 0);
  Processo p3 = Processo("Processo 3", 7, false, 0, 0);

  //print('\nIniciando escalonador FCFS..');
  FcfsService serviceFCFS = FcfsService();
  //serviceFCFS.fcfs(p1, p2, p3);

  //print('\nIniciando escalonador SJF..');
  SjfService serviceSJF = SjfService();
  //serviceSJF.sjf(p1, p2, p3);

  ProcessoSRT p4 = ProcessoSRT(
    name: 'Processo 1',
    burstTime: 2,
    hasInterruption: true,
    timeSpent: 0,
    returnTime: 0,
    arrivalTime: 0,
  );
  ProcessoSRT p5 = ProcessoSRT(
    name: 'Processo 2',
    burstTime: 5,
    hasInterruption: true,
    timeSpent: 0,
    returnTime: 0,
    arrivalTime: 6,
  );
  ProcessoSRT p6 = ProcessoSRT(
    name: 'Processo 3',
    burstTime: 7,
    hasInterruption: true,
    timeSpent: 0,
    returnTime: 0,
    arrivalTime: 2,
  );

  // print('\nIniciando escalonador SRT..');
  // SrtService serviceSRT = SrtService();
  // serviceSRT.srt(p4, p5, p6);

  // print('\nIniciando escalonador DULING..');
  // DulingService serviceDULING = DulingService();
  // serviceDULING.duling(p1, p2, p3);

  print('\nIniciando escalonador RR..');
  RrService serviceRr = RrService();
  serviceRr.rr(p1, p2, p3);
}
