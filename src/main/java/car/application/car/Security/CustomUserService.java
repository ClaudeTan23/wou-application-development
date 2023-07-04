package car.application.car.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import car.application.car.Entity.User;
import car.application.car.Repository.UserRepo;

@Service
public class CustomUserService implements UserDetailsService
{
    @Autowired
    UserRepo user;

    @Override
    public UserDetails loadUserByUsername(String username)
    {
        User existedUser = user.findByUsername(username);

        if(existedUser == null)
        {
            throw new UsernameNotFoundException(username);
        }

        return new AuthUser(existedUser);
    }
}
