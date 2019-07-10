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
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
