import controller.ProcessosController;
import models.Processos;

public class App {
    public static void main(String[] args) throws Exception {
        Processos p1 = new Processos("Processo 1", 4, true, 0);
        Processos p2 = new Processos("Processo 2", 5, false, 0);
        Processos p3 = new Processos("Processo 3", 7, false, 0);

        ProcessosController pController = new ProcessosController();
        System.out.println("Iniciando escalonamento FCFS:");
       // pController.fcfs(p1, p2, p3);

        System.out.println("Iniciando escalonamento SJF"); 
        pController.sjf(p1, p2, p3);
    }
}
