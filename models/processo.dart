class Processo {
  String name = "";
  int burstTime = 0;
  bool hasInterruption = false;
  int timeSpent = 0;
  int returnTime = 0;

  Processo({
    required this.name,
    required this.burstTime,
    required this.hasInterruption,
    required this.timeSpent,
    required this.returnTime,
  });
}
