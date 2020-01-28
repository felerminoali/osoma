package mz.co.osoma.converter;

import mz.co.osoma.model.Gender;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component("genderconverter")
public class GenderConverter implements Converter<String, Gender> {
    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @Override
    public Gender convert(String id) {
        return crudService.get(Gender.class, Integer.parseInt(id));
    }
}