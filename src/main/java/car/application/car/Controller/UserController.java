package car.application.car.Controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import car.application.car.Entity.User;
import car.application.car.Repository.UserRepo;

@Controller
public class UserController
{
    @Autowired
    UserRepo userRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/update-user", method = RequestMethod.POST)
    public String UpdateUser(Model model, User user, Principal p, RedirectAttributes redirect)
    {
        User getUser = userRepo.findUserById(Long.valueOf(p.getName()));
        String encryptPassword  = passwordEncoder.encode(user.getPassword());
         System.out.println(getUser.getUsername());
        System.out.println(encryptPassword);

        // if(user.getPassword() != null) getUser.setPassword(encryptPassword);

        if(user.getEmail() != null) getUser.setEmail(user.getEmail());

        if(user.getLocation() != null) getUser.setLocation(user.getLocation());

        if(user.getPhone_number() != null) getUser.setPhone_number(user.getPhone_number());

        userRepo.save(getUser);

        redirect.addAttribute("result", "Updated");

        return "redirect:/profile";
    }

}
