class Processo {
  String name = "";
  int time = 0;
  bool interrupted = false;
  int timeSpent = 0;
  int stopInterruptionTime=0;

  Processo(this.name, this.time, this.interrupted, this.timeSpent,this.stopInterruptionTime);

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

  int get getTimeInterrupted{
    return stopInterruptionTime;
  }

  set setTimeInterrupted(int timeInterrupted) {
    setTimeInterrupted = timeInterrupted;
  }
}
