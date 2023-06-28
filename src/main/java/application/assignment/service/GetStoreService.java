package application.assignment.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import application.assignment.Exception.StoreNotFound;
import application.assignment.repository.StoreRepository;

@Service
public class GetStoreService
{
    public String GetStore(Model model, StoreRepository store, Long id)
    {
        if(store.existsById(id))
        {
            List<String> locations = Arrays.asList(store.findById(id).get().getLocalities().split(","));

            model.addAttribute("store", store.findById(id).get());
            model.addAttribute("locations", locations);
            
            return "store";

        } else 
        {
            throw new StoreNotFound();
        }
    }    
}
