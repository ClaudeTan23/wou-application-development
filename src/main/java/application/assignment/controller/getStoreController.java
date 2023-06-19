package application.assignment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import application.assignment.entity.StoreEntity;
import application.assignment.service.AddStoreDAO;

@Controller
public class getStoreController 
{
    @Autowired
    public AddStoreDAO store;

    @RequestMapping(value = "/get-store", method = RequestMethod.GET)
    public String getStore(Model model)
    {

        model.addAttribute("store", store.getStores());
        if(store.getStores().size() > 0) 
        {
            List<StoreEntity> a = store.getStores();
            System.out.println(a.get(0).localities.length);
            System.out.println(String.join(",", a.get(0).localities));
        }
        
        return "get-store";
    }    
}
