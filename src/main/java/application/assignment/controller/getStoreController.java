package application.assignment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.assignment.entity.StoreEntity;
import application.assignment.repository.StoreRepository;
import application.assignment.service.AddStoreDAO;
import application.assignment.service.GetStoreService;

@Controller
public class getStoreController 
{
    @Autowired
    public AddStoreDAO store;

    @Autowired
    public StoreRepository stores;

    @Autowired
    public GetStoreService getStore;

    @RequestMapping(value = "/get-store", method = RequestMethod.GET)
    public String getStore(Model model)
    {

        model.addAttribute("store", stores.findAll());

        // if(stores.count() > 0)
        // {
        //     System.out.println(stores.findAll().get(0).getName());
        // }
        
        return "get-store";
    }
    
    @RequestMapping(value = "/store/{id}", method = RequestMethod.GET)
    public String store(Model model, @PathVariable Long id)
    {
        return getStore.GetStore(model, stores, id);
    }
}
