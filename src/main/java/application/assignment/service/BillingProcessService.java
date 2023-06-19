package application.assignment.service;

import org.springframework.stereotype.Component;

import application.assignment.entity.PaymentEntity;

@Component
public class BillingProcessService 
{
    private PaymentEntity paymentOption;
    public GPayProcess gPayProcessor = new GPayProcess();
    public CreditCartProcess creditCardProcessor = new CreditCartProcess();

    public BillingProcessService(PaymentEntity paymentOption)
    {
        this.paymentOption = paymentOption;
    }

    public boolean ProcessPayment(String option)
    {
        if(option.trim() == "") 
        {
            System.out.println("null payment option");
            return false;
        }

        if(paymentOption.GooglePayOption.equalsIgnoreCase(option))
        {
            System.out.println("Process Google Pay Payment...");
            return gPayProcessor.Process();

        } else if(paymentOption.CreditCardOption.equalsIgnoreCase(option))
        {
            System.out.println("Process Credit Card Payment...");
            return creditCardProcessor.Process();
        }

        System.out.println("Unknown Payment Method.");
        return false;
     
    }

}
