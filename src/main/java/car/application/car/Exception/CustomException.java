package car.application.car.Exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

public class CustomException 
{
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    @ExceptionHandler(NotFound.class)
    public String NotFound()
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
