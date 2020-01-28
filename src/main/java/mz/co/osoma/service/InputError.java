package mz.co.osoma.service;

public class InputError {

    public static final String NOTEMPTY = "Este campo não deve estar vazio";
    private String field;
    private String error;

    public InputError() {
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
