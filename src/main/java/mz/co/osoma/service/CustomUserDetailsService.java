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

import java.util.Optional;

//@Service
//public class CustomUserDetailsService implements UserDetailsService {
//
//    @Autowired
//    private UsersRepository usersRepository;
//
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//
//        Optional<User> optionalUsers = usersRepository.findByName(username);
//
//        optionalUsers
//                .orElseThrow(() -> new UsernameNotFoundException("Username not found"));
//        CustomUserDetails customUserDetails = optionalUsers
//                .map(users -> {
//                    return new CustomUserDetails(users);
//                }).get();
//        return customUserDetails;
//    }
//}

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    @Qualifier("CRUDServiceImpl")
    private CRUDService crudService;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException,
            DataAccessException {

        User u = crudService.findEntByJPQueryT("SELECT u FROM User u WHERE u.email = '"+email+"'", null);

        Optional<User> optionalUsers = Optional.of(u);
        optionalUsers
                .orElseThrow(() -> new UsernameNotFoundException("Username not found"));
        CustomUserDetails customUserDetails = optionalUsers
                .map(users -> {
                    return new CustomUserDetails(users);
                }).get();
        return customUserDetails;

    }

}
