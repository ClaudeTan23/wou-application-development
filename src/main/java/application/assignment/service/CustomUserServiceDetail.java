package application.assignment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import application.assignment.entity.UserEntity;
import application.assignment.repository.UserRepository;

@Service
public class CustomUserServiceDetail implements UserDetailsService
{
    @Autowired
    UserRepository userRepo;

    @Override
    public UserDetails loadUserByUsername(String username)
    {
        UserEntity users = userRepo.findByUsername(username);
        // System.out.println(users == null);

        if(users == null) 
        {
            System.out.println(users == null);
            throw new UsernameNotFoundException(username);
            
        }

        return new AuthUserDetail(users);
    }
}