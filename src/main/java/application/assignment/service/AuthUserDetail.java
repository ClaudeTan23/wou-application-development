package application.assignment.service;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import application.assignment.entity.RoleEntity;
import application.assignment.entity.UserEntity;

public class AuthUserDetail implements UserDetails 
{
    private UserEntity user;
    
    public AuthUserDetail(UserEntity user)
    {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() 
    {
        Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();

        for(RoleEntity role: this.user.getRoles())
        {
            System.out.println(authorities.add(new SimpleGrantedAuthority(role.getName())));
        }

        // authorities.add(new SimpleGrantedAuthority("VIEW_STORE"));

        return authorities;
    }

    @Override
    public String getPassword() 
    {
        return this.user.getPassword();
    }

    @Override
    public String getUsername() 
    {
        return String.valueOf(this.user.getId());
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
