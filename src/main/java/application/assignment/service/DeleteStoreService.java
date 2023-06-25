package application.assignment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import application.assignment.entity.Store;
import application.assignment.repository.StoreRepository;

@Service
public class DeleteStoreService 
{
    public String DeleteStore(Model model, Long id, StoreRepository storeRepo)
    {
        if(storeRepo.existsById(id))
        {
            Store store = storeRepo.findById(Long.valueOf(id)).get();

            storeRepo.delete(store);
            return "redirect:get-store";

        } else 
        {
            return "404";
        }

    }
}
