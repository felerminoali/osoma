package mz.co.osoma.service;

public class SavedAnswerResponse {

    private String idQuestion;
    private String idChoice;
    private String label;

    public SavedAnswerResponse(String idQuestion, String idChoice, String label) {
        this.idQuestion = idQuestion;
        this.idChoice = idChoice;
        this.label = label;
    }

    public SavedAnswerResponse() {
    }

    public String getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(String idQuestion) {
        this.idQuestion = idQuestion;
    }

    public String getIdChoice() {
        return idChoice;
    }

    public void setIdChoice(String idChoice) {
        this.idChoice = idChoice;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    @Override
    public String toString() {
        return "SavedAnswerResponse{" +
                "idQuestion='" + idQuestion + '\'' +
                ", idChoice='" + idChoice + '\'' +
                ", label='" + label + '\'' +
                '}';
    }
}
