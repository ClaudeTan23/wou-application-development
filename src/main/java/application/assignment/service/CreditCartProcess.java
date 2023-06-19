package application.assignment.service;

import application.assignment.interfaces.PaymentProccesor;

public class CreditCartProcess implements PaymentProccesor 
{
    public boolean Process()
    {
        System.out.println("Credit Card Payment Success");
        return true;
    }    
}
