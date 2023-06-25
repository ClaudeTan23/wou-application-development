package application.assignment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import application.assignment.entity.Store;
import application.assignment.repository.StoreRepository;
import application.assignment.service.DeleteStoreService;

@Controller
public class deleteStoreController 
{
    @Autowired
    public StoreRepository stores;

    @Autowired
    public DeleteStoreService delStore;

    @RequestMapping(value = "/delete-store", method = RequestMethod.POST)
    public String deleteStore(Model model, Store store)
    {
        // Store getExistedStore = stores.findById(store.getId()).get();
        // stores.delete(getExistedStore);
        // System.out.println(getExistedStore.getName());

        return delStore.DeleteStore(model, Long.valueOf(store.getId()), stores);

        // return "redirect:get-store";
    }
}
