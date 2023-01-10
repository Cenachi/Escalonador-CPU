class Processo {
  int id = 0; //Identificação
  int tempoRajada = 0; // Tempo de execução total do processo
  bool interrompe = false; // Se tem interrupçao ou não
  int prioridade = 0; // Prioridade do processo
  String estado = ""; // Estado do processo (Executando, Bloqueado ou Pronto)
  int tempoChegada = 0; //Momento que o processo chega pra executar
  int tempoCPU = 0; //Tempo que executou na CPU
  int tempoRetorno = 0;

  Processo({
    required this.id,
    required this.tempoRajada,
    required this.interrompe,
    required this.prioridade,
    required this.estado,
    required this.tempoChegada,
    required this.tempoCPU,
    required this.tempoRetorno,
  });

  int get getId => this.id;

  set setId(int id) => this.id = id;

  get getTempoRajada => this.tempoRajada;

  set setTempoRajada(tempoRajada) => this.tempoRajada = tempoRajada;

  get getInterrompe => this.interrompe;

  set setInterrompe(interrompe) => this.interrompe = interrompe;

  get getPrioridade => this.prioridade;

  set setPrioridade(prioridade) => this.prioridade = prioridade;

  get getEstado => this.estado;

  set setEstado(estado) => this.estado = estado;

  get getTempoChegada => this.tempoChegada;

  set setTempoChegada(tempoChegada) => this.tempoChegada = tempoChegada;

  get getTempoCPU => this.tempoCPU;

  set setTempoCPU(tempoCPU) => this.tempoCPU = tempoCPU;

  get getTempoRetorno => this.tempoRetorno;

  set setTempoRetorno(tempoRetorno) => this.tempoRetorno = tempoRetorno;
}
