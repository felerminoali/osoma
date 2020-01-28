package mz.co.osoma.converter;

import mz.co.osoma.model.Gender;
import mz.co.osoma.model.MaritalStatus;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;


@Component("maritalstatusconverter")
public class MaritalStatusConverter implements Converter<String, MaritalStatus> {
    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @Override
    public MaritalStatus convert(String id) {
        return crudService.get(MaritalStatus.class, Integer.parseInt(id));
    }
}