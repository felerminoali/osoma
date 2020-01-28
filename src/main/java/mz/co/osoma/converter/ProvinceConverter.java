package mz.co.osoma.converter;

import mz.co.osoma.model.Province;
import mz.co.osoma.service.CRUDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;


@Component("provinceconverter")
public class ProvinceConverter implements Converter<String, Province> {
    @Autowired
    @Qualifier("CRUDServiceImpl")
    public CRUDService crudService;

    @Override
    public Province convert(String id) {
        return crudService.get(Province.class, Integer.parseInt(id));
    }
}