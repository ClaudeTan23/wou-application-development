package application.assignment.entity;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username", nullable = false, length = 255)
    private String username;

    @Column(name = "password", nullable = false, length = 255)
    private String password;

    @Column(name = "email", nullable = false, length = 255)
    private String email;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "test",
        joinColumns = @JoinColumn(name = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<RoleEntity> roles = new HashSet<RoleEntity>();

    public Long getId()
    {
        return this.id;
    }

    public Long setId(Long id)
    {
        this.id = id;
        return this.id;
    }

    public String getUsername()
    {
        return this.username;
    }

    public String setUsername(String username)
    {
        this.username = username;
        return this.username;
    }

    public String getPassword()
    {
        return this.password;
    }

    public String setPassword(String password)
    {
        this.password = password;
        return this.password;
    }

    public String getEmail()
    {
        return this.email;
    }

    public String setEmail(String email)
    {
        this.email = email;
        return this.email;
    }

    public Set<RoleEntity> getRoles()
    {
        return this.roles;
    }

    public void setRoles(RoleEntity roles)
    {
        this.roles.add(roles);
    }

}
