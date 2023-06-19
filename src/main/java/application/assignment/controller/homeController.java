package application.assignment.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import application.assignment.service.BillingConfig;
import application.assignment.service.BillingProcessService;

@Controller
public class homeController 
{
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model)
    {
        ApplicationContext context = new AnnotationConfigApplicationContext(BillingConfig.class);
        BillingProcessService billingProcess = context.getBean(BillingProcessService.class);

        billingProcess.ProcessPayment("GPay");

        return "index";

    }

}
