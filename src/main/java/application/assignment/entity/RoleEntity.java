package application.assignment.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "roles")
public class RoleEntity 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @ManyToMany(mappedBy = "roles")
    Set<UserEntity> users;

    public Long getId()
    {
        return this.id;
    }

    public Long setId(Long id)
    {
        this.id = id;
        return this.id;
    }

    public String getName()
    {
        return this.name;
    }

    public String setName(String name)
    {
        this.name = name;
        return this.name;
    }
}
