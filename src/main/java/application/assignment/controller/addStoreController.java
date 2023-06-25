package application.assignment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import application.assignment.entity.Store;
import application.assignment.entity.StoreEntity;
import application.assignment.entity.TestingEntity;
import application.assignment.repository.StoreRepository;
import application.assignment.repository.TestingRepository;
import application.assignment.service.AddStoreDAO;


@Controller
public class addStoreController 
{
    @Autowired
    public AddStoreDAO store;

    @Autowired
    public StoreRepository stores;

    @RequestMapping(value = "/add-store", method = RequestMethod.GET)
    public String getStore(Model model)
    {
        return "add-store";
    }

    @RequestMapping(value = "/add-store", method = RequestMethod.POST)
    public String addStore(Model model, Store storeVal)
    {
        // store.addStores(storeVal);

        stores.save(storeVal);

        return "redirect:get-store";
    }


}
