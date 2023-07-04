package car.application.car.Security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import car.application.car.Entity.Role;
import car.application.car.Entity.User;

public class AuthUser implements UserDetails
{
    private User AuthUser;

    public AuthUser(User user)
    {
        this.AuthUser = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities()
    {
        Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();

        for(Role authRole: this.AuthUser.getRoles())
        {
            authorities.add(new SimpleGrantedAuthority(authRole.getRoles()));
        }

        return authorities;
    }

    @Override
    public String getPassword()
    {
        System.out.println(this.AuthUser.getPassword());
        return this.AuthUser.getPassword();
    }

    @Override
    public String getUsername() 
    {
        return this.AuthUser.getId().toString();    
    }

    @Override
    public boolean isAccountNonExpired() 
    {
        return true;    
    }

    @Override
    public boolean isAccountNonLocked() 
    {
        return true;    
    }

    @Override
    public boolean isCredentialsNonExpired() 
    {
        return true; 
    }

    @Override
    public boolean isEnabled() 
    {
        return true; 
    }
}
