package application.assignment.entity;

public class PaymentEntity
{
    public String GooglePayOption;
    public String CreditCardOption;

    public PaymentEntity(String googlePayoption, String creditCardOption)
    {
        this.GooglePayOption  = googlePayoption;
        this.CreditCardOption = creditCardOption;
    }

    public String getGooglePayOption() 
    {
        return GooglePayOption;
    }

    public String setGooglePayOption(String googlePayOption)
    {
        this.GooglePayOption = googlePayOption;
        return this.GooglePayOption;
    }

    public String getCreditCardOption() 
    {
        return CreditCardOption;
    }

    public String setCreditCardOption(String creditCardOption)
    {
        this.CreditCardOption = creditCardOption;
        return this.CreditCardOption;
    }

}