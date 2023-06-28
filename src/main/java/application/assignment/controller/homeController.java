package application.assignment.controller;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import application.assignment.CustomExceptionHandle.CustomHandle;
import application.assignment.Exception.StoreNotFound;
import application.assignment.entity.RoleEntity;
import application.assignment.entity.UserEntity;
import application.assignment.repository.RoleRepository;
import application.assignment.repository.StoreRepository;
import application.assignment.repository.TestingRepository;
import application.assignment.repository.UserRepository;
import application.assignment.service.BillingConfig;
import application.assignment.service.BillingProcessService;
import application.assignment.service.RegisterService;

@Controller
public class homeController extends CustomHandle
{
    // @Autowired
    // public StoreRepository store;

    // @Autowired
    // public TestingRepository Testing;

    @Autowired
    UserRepository userRepo;

    @Autowired
    RoleRepository roleRepo;

    @Autowired
    RegisterService registerService;

    private static final Logger logger = LoggerFactory.getLogger(homeController.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model, Principal p, Authentication auth)
    {
        // ApplicationContext context = new AnnotationConfigApplicationContext(BillingConfig.class);
        // BillingProcessService billingProcess = context.getBean(BillingProcessService.class);

        // billingProcess.ProcessPayment("GPay");
        // System.out.println(store.findByName("7eleven").get(0).getTesting().getContent());
        // System.out.println(store.findAll());
        // System.out.println(Testing.findByUsername("ben").get(0).getStore_id());

        // logger.info("this is a info message");
        // logger.warn("this is a warn message");
        // logger.error("this is a error message");
 
        if(auth == null)
        {
            model.addAttribute("roles", null);

        } else 
        {
            model.addAttribute("roles", auth.getAuthorities());
        }
        

        return "index";

    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String Login(Model model)
    {

        return "login";

    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String Register(Model model, UserEntity user, RedirectAttributes redirectModel)
    {
        return registerService.register(model, user, userRepo, redirectModel);
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String About()
    {
        throw new StoreNotFound();
    }

    @RequestMapping(value = "/403")
    public String Forbidden()
    {
        return "403";
    }
    
}
