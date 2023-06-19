package application.assignment.entity;

public class StoreEntity 
{
    public String name;
    public int phone_number;
    public String[] localities;

    public String getName()
    {
        return this.name;
    }

    public String setName(String name) 
    {
        this.name = name;
        return this.name;
    }

    public int getPhone_number()
    {
        return this.phone_number;
    }

    public int setPhone_number(int phone_number) 
    {
        this.phone_number = phone_number;
        return this.phone_number;
    }

    public String[] getLocalities()
    {
        return this.localities;
    }

    public String[] setLocalities(String[] localities)
    {
        this.localities = localities;
        return this.localities;
    }
    
}
