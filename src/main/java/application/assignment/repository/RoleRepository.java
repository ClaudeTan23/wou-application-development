package application.assignment.repository;

import org.springframework.data.repository.CrudRepository;

import application.assignment.entity.RoleEntity;

public interface RoleRepository extends CrudRepository<RoleEntity, Long>
{
    RoleEntity findByName(String name);
}
