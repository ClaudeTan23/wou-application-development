package application.assignment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import application.assignment.repository.StoreRepository;
import application.assignment.repository.TestingRepository;
import application.assignment.service.BillingConfig;
import application.assignment.service.BillingProcessService;

@Controller
public class homeController 
{
    // @Autowired
    // public StoreRepository store;

    // @Autowired
    // public TestingRepository Testing;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model)
    {
        ApplicationContext context = new AnnotationConfigApplicationContext(BillingConfig.class);
        BillingProcessService billingProcess = context.getBean(BillingProcessService.class);

        billingProcess.ProcessPayment("GPay");
        // System.out.println(store.findByName("7eleven").get(0).getTesting().getContent());
        // System.out.println(store.findAll());
        // System.out.println(Testing.findByUsername("ben").get(0).getStore_id());

        return "index";

    }

}
