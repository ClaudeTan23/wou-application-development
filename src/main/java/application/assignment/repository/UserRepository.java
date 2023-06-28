package application.assignment.repository;

import org.springframework.data.repository.CrudRepository;

import application.assignment.entity.UserEntity;
import java.util.List;


public interface UserRepository extends CrudRepository<UserEntity, Long>
{
    UserEntity findByUsername(String username);
}
