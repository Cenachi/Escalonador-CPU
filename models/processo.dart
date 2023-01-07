class Processo {
  String name = "";
  int burstTime = 0;
  bool hasInterruption = false;
  int timeSpent = 0;
  int returnTime = 0;

  Processo(
    this.name,
    this.burstTime,
    this.hasInterruption,
    this.timeSpent,
    this.returnTime,
  );
}
