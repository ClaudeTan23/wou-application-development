package car.application.car.Repository;

import org.springframework.data.repository.CrudRepository;

import car.application.car.Entity.BookTest;

public interface BookTestRepo extends CrudRepository<BookTest, Long>
{
        
}
