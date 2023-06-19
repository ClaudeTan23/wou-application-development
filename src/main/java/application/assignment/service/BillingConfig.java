package application.assignment.service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import application.assignment.entity.PaymentEntity;

@Configuration
@ComponentScan(basePackageClasses = BillingProcessService.class)
public class BillingConfig 
{
    @Bean
    public PaymentEntity getProcess()
    {
        return new PaymentEntity("GPay", "Credit_Card");
    }    
}
