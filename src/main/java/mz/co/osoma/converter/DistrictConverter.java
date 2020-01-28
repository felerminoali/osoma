package mz.co.osoma.converter;

import mz.co.osoma.model.District;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component("districtconverter")
public class DistrictConverter implements Converter<String, District> {
    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @Override
    public District convert(String id) {
        return crudService.get(District.class, Integer.parseInt(id));
    }
}