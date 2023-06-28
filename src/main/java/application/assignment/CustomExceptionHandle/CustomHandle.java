package application.assignment.CustomExceptionHandle;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import application.assignment.Exception.Forbidden;
import application.assignment.Exception.StoreNotFound;

public class CustomHandle 
{
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    @ExceptionHandler(StoreNotFound.class)
    public String StoreNotFound()
    {
        return "404";
    }

    @ResponseStatus(value = HttpStatus.FORBIDDEN)
    @ExceptionHandler(Forbidden.class)
    public String Forbidden()
    {
        return "403";
    }
}
