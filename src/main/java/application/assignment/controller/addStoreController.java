package application.assignment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import application.assignment.entity.StoreEntity;
import application.assignment.service.AddStoreDAO;


@Controller
public class addStoreController 
{
    @Autowired
    public AddStoreDAO store;

    @RequestMapping(value = "/add-store", method = RequestMethod.GET)
    public String getStore(Model model)
    {
        return "add-store";
    }

    @RequestMapping(value = "/add-store", method = RequestMethod.POST)
    public String addStore(Model model, StoreEntity storeVal)
    {
        store.addStores(storeVal);
        return "redirect:get-store";
    }


}
