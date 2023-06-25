package application.assignment.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import application.assignment.entity.Store;

public interface StoreRepository extends CrudRepository<Store, Long>
{
    List<Store> findByName(String name);

    List<Store> findAll();

    List<Store> findAllById(Long id);



    // Store save(Store entity);
}
