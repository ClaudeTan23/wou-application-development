package application.assignment.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "testing")
public class TestingEntity 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  
    
    private String username;

    private String content;

    private String store_id;

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

    public String getContent()
    {
        return this.content;
    }

    public String setContent(String content)
    {
        this.content = content;
        return this.content;
    }

    public String getStore_id()
    {
        return this.store_id;
    }

    public String setStore_id(String store_id)
    {
        this.store_id = store_id;
        return this.store_id;
    }
    
}
