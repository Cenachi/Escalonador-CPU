import 'duling/fila.dart';
import 'fcfs/fila.dart';
import 'rr/fila.dart';
import 'sjf/fila.dart';
import 'srt/fila.dart';

void main(List<String> arguments) {
  FilaFCFS.init();
  FilaSJF.init();
  FilaRR.init();
  FilaSRT.init();
  FilaDuling.init();
}
