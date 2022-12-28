package models;

public class Processos implements Comparable<Processos> {

    private String name;
    private int time;
    private boolean interrupted;
    private int timeSpent;

    public Processos() {
    }

    public Processos(String name, int time, boolean interrupted, int timeSpent) {
        this.name = name;
        this.time = time;
        this.interrupted = interrupted;
        this.timeSpent = timeSpent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public void setInterrupted(boolean interrupted) {
        this.interrupted = interrupted;
    }

    public boolean getInterrupted() {
        return interrupted;
    }

    public int getTimeSpent() {
        return timeSpent;
    }

    public void setTimeSpent(int timeSpent) {
        this.timeSpent = timeSpent;
    }

    @Override
    public int compareTo(Processos outroProcesso) {
        if (this.time > outroProcesso.getTime()) {
            return 1;
        } else if (this.time < outroProcesso.getTime()) {
            return -1;
        }
        return 0;
    }
}
