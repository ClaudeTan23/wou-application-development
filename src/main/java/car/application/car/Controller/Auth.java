package car.application.car.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import car.application.car.Entity.User;
import car.application.car.Service.Register;

@Controller
public class Auth 
{
    @Autowired
    Register registerService;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String Register(RedirectAttributes model, User user)
    {
        return registerService.CheckUsers(user, model);
    }

    @RequestMapping(value = "/register-admin", method = RequestMethod.POST)
    public String AdminRegister(RedirectAttributes model, User user)
    {
        return registerService.CheckAdmin(user, model);
    }
}
