package car.application.car.Repository;

import org.springframework.data.repository.CrudRepository;

import car.application.car.Entity.Role;

public interface RoleRepo extends CrudRepository<Role, Long>
{
    Role findByRoles(String role);
}
