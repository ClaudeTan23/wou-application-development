package application.assignment.service;

import application.assignment.interfaces.PaymentProccesor;

public class GPayProcess implements PaymentProccesor 
{
    public boolean Process()
    {
        System.out.println("Google Pay Payment Success");
        return true;
    }
}
