package controller;

import java.util.Random;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import models.Processo;

public class ProcessoController {
    static Queue<Processo> readyQueue = new LinkedList<Processo>();
    static Random random = new Random();

    public static void fcfs(Processo p1, Processo p2, Processo p3) throws InterruptedException {
        readyQueue.add(p1);
        readyQueue.add(p2);
        readyQueue.add(p3);

        while (!readyQueue.isEmpty()) {

            Processo p = readyQueue.remove();

            if (p.getInterrupted()) {
                int interrupted = random.nextInt(p.getTime()) + 1;

                for (int j = 0; j < interrupted; j++) {
                    System.out.print("\r" + p.getName() + " em: " + j + "s");
                    Thread.sleep(1000);
                }
                readyQueue.add(new Processo(p.getName(), p.getTime(), false, interrupted));

            } else {
                for (int i = p.getTimeSpent(); i <= p.getTime(); i++) {
                    System.out.print("\r" + p.getName() + " em: " + i + "s");
                    Thread.sleep(1000);
                }
            }
            System.out.println();
        }
    }

    public static void sjf(Processo p1, Processo p2, Processo p3) throws InterruptedException {

        readyQueue.add(p1);
        readyQueue.add(p2);
        readyQueue.add(p3);

        Collections.sort((List<Processo>) readyQueue);

        while (!readyQueue.isEmpty()) {

            Processo p = readyQueue.remove();
            Collections.sort((List<Processo>) readyQueue);

            if (p.getInterrupted()) {
                int interrupted = random.nextInt(p.getTime()) + 1;

                for (int j = 0; j < interrupted; j++) {
                    System.out.print("\r" + p.getName() + " em: " + j + "s");
                    Thread.sleep(1000);
                }
                readyQueue.add(new Processo(p.getName(), p.getTime(), false, interrupted));

            } else {
                for (int i = p.getTimeSpent(); i <= p.getTime(); i++) {
                    System.out.print("\r" + p.getName() + " em: " + i + "s");
                    Thread.sleep(1000);
                }
            }
            System.out.println();
        }
    }

    public static void srt(Processo p1, Processo p2, Processo p3) throws InterruptedException {

    }

    public static void duling(Processo p1, Processo p2, Processo p3) throws InterruptedException {

    }

    public static void rr(Processo p1, Processo p2, Processo p3) throws InterruptedException {

    }
}
