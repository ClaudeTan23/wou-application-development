package application.assignment.Exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "Store non existed.")
public class StoreNotFound extends RuntimeException
{
    
}
