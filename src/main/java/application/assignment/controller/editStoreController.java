package application.assignment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import application.assignment.entity.Store;
import application.assignment.repository.StoreRepository;

@Controller
public class editStoreController 
{
    @Autowired
    public StoreRepository store;


    @RequestMapping(value = "/edit-store/{id}", method = RequestMethod.GET)
    public String editStore(Model model, @PathVariable String id)
    {
        Long ids = Long.valueOf(id);
        System.out.println(store.findAllById(ids).size());
        System.out.print(id);

        model.addAttribute("store", store.findAllById(ids));
        return "edit-store";
    }    

    @RequestMapping(value = "/edit-store/{id}", method = RequestMethod.POST)
    public String editStoreData(Model model, @PathVariable Long id, Store val)
    {
        Store existedStore = store.findById(id).get();

        existedStore.setName(val.getName());
        existedStore.setPhone_number(val.getPhone_number());
        existedStore.setLocalities(val.getLocalities());

        store.save(existedStore);

        return "redirect:../get-store";   
    }
}
