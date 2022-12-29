import models.Processo;
import services.ProcessoService;

public class App {
    public static void main(String[] args) throws Exception {
        Processo p1 = new Processo("Processo 1", 4, true, 0);
        Processo p2 = new Processo("Processo 2", 5, false, 0);
        Processo p3 = new Processo("Processo 3", 7, false, 0);

        ProcessoService pController = new ProcessoService();
        System.out.println("Iniciando escalonamento FCFS:");
       // pController.fcfs(p1, p2, p3);

        System.out.println("Iniciando escalonamento SJF"); 
        pController.sjf(p1, p2, p3);
    }
}
