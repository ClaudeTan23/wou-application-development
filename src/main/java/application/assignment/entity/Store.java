package application.assignment.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
public class Store 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 255, nullable = false, unique = false)
    private String name;

    // @Transient       this annotation use to ignored the field to create a column in the table
    @Column(length = 255, nullable = false, unique = false)
    private String phone_number;

    @Column(length = 255, nullable = false, unique = false)
    private String localities;

    public Store() {}

    public Store(String name, String phone_number, String localities)
    {
        this.name = name;
        this.phone_number = phone_number;
        this.localities = localities;
    
    }

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

    public String getPhone_number()
    {
        return this.phone_number;
    }

    public String setPhone_number(String phone_number) 
    {
        this.phone_number = phone_number;
        return this.phone_number;
    }

    public String getLocalities()
    {
        return this.localities;
    }

    public String setLocalities(String localities)
    {
        this.localities = localities;
        return this.localities;
    }
    
}
