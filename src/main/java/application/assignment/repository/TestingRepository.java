package application.assignment.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import application.assignment.entity.TestingEntity;

public interface TestingRepository extends CrudRepository<TestingEntity, Long> 
{
    List<TestingEntity> findByUsername(String username);
}
