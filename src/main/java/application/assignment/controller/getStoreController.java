package application.assignment.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

import application.assignment.CustomExceptionHandle.CustomHandle;
import application.assignment.Exception.StoreNotFound;
import application.assignment.entity.StoreEntity;
import application.assignment.repository.StoreRepository;
import application.assignment.service.AddStoreDAO;
import application.assignment.service.GetStoreService;

@Controller
public class getStoreController extends CustomHandle
{
    @Autowired
    public AddStoreDAO store;

    @Autowired
    public StoreRepository stores;

    @Autowired
    public GetStoreService getStore;

    @RequestMapping(value = "/get-store", method = RequestMethod.GET)
    public String getStore(Model model, Principal p, HttpSession session, Authentication auth)
    {
        // Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // String currentPrincipalName = authentication.getName();
        // System.out.println(p);
        // System.out.println(auth.getAuthorities());
        // session.setAttribute("test", "lol");
        model.addAttribute("store", stores.findAll());
        model.addAttribute("roles", auth.getAuthorities());

        // if(stores.count() > 0)
        // {
        //     System.out.println(stores.findAll().get(0).getName());
        // }
        
        Logger logger = LoggerFactory.getLogger(getStoreController.class);
        logger.info("User Role: " + auth.getAuthorities() + " Logging...");
        
        return "get-store";
    }
    
    @RequestMapping(value = "/store/{id}", method = RequestMethod.GET)
    public String store(Model model, @PathVariable Long id, HttpSession session)
    {
        // System.out.println(session.getAttribute("test"));
        //  throw new StoreNotFound();

        return getStore.GetStore(model, stores, id);
    }

}
