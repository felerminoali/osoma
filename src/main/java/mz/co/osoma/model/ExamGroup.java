package mz.co.osoma.model;

public class ExamGroup {
    public int count;
    public int year;
    public int id;
    public String description;

    public ExamGroup(){}

    public ExamGroup(int count, int year){
        this.count = count;
        this.year = year;
    }
    public ExamGroup(int count, String description){
        this.count = count;
        this.description = description;
    }

    public ExamGroup(int count, String description, int id){
        this.count = count;
        this.description = description;
        this.id = id;
    }
}
