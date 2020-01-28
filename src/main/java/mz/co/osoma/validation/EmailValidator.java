package mz.co.osoma.validation;

import mz.co.osoma.model.User;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.HashMap;
import java.util.Map;

public class EmailValidator implements ConstraintValidator<EmailOrContactDuplication, String> {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @Override
    public boolean isValid(String value, ConstraintValidatorContext Context) {
        Map<String, Object> par = new HashMap<String, Object>();
        par.put("value", value);

        User u = null;
        try {
            u = crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.email = :value OR u.contact = :value", par);
        } catch (NullPointerException ex) {
            return true;
        }
        return (u==null);
    }
}
