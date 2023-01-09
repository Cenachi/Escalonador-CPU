import '../duling/services/duling_list.dart';
import '../fcfs/services/fcfs_list.dart';
import '../rr/services/rr_list.dart';
import '../sjf/services/sjf_list.dart';
import '../srt/services/srt_list.dart';

void main(List<String> arguments) {
  QueueFCFS.fcfsQueue();
  QueueSJF.sjfQueue();
  QueueSRT.srtQueue();
  QueueDuling.dulingQueue();
  QueueRR.rrQueue();
}
