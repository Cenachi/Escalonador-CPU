class Processo implements Comparable<Processo> {
  String name = "";
  int time = 0;
  bool interrupted = false;
  int timeSpent = 0;

  Processo(
    this.name,
    this.time,
    this.interrupted,
    this.timeSpent
  );

  String get getName {
    return name;
  }

  set setName(String name) {
    setName = name;
  }

  int get getTime {
    return time;
  }

  set setTime(int time) {
    setTime = time;
  }

  bool get getInterrupted {
    return interrupted;
  }

  set setInterrupted(bool interrupted) {
    setInterrupted = interrupted;
  }

  int get getTimeSpent {
    return timeSpent;
  }

  set setTimeSpent(int timeSpent) {
    setTimeSpent = timeSpent;
  }

  int compareTo(Processo outroProcess) {
    if (this.time > outroProcess.getTime) {
      return 1;
    } else if (this.time < outroProcess.getTime) {
      return -1;
    }
    return 0;
  }
}
