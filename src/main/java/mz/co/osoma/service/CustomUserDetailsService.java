package mz.co.osoma.service;


import mz.co.osoma.model.CustomUserDetails;
import mz.co.osoma.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;


@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    CRUDService crudService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException,
            DataAccessException {

        Map<String, Object> par = new HashMap<String, Object>();
        par.put("username", username);
        User u = crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.email = :username OR u.contact = :username", par);


        CustomUserDetails customUserDetails = null;

        if (u != null) {

            Optional<User> optionalUsers = Optional.of(u);
            optionalUsers
                    .orElseThrow(() -> new UsernameNotFoundException("Username not found"));
            customUserDetails = optionalUsers
                    .map(users -> {
                        return new CustomUserDetails(users);
                    }).get();

        }else{
            throw new UsernameNotFoundException("Username not found");
        }

       return customUserDetails;
    }

}
