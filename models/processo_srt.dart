class ProcessoSRT {
  String name = "";
  int burstTime = 0; // Tempo de execução
  bool hasInterruption = false;
  int timeSpent = 0; //Tempo gasto
  int returnTime = 0; // Tempo para voltar a executar
  int arrivalTime = 0; //Tempo de chegada

  ProcessoSRT({
    required this.name,
    required this.burstTime,
    required this.hasInterruption,
    required this.timeSpent,
    required this.returnTime,
    required this.arrivalTime,
  });
}
