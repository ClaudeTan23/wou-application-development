package car.application.car.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import car.application.car.Entity.Role;
import car.application.car.Entity.User;
import car.application.car.Repository.RoleRepo;
import car.application.car.Repository.UserRepo;

@Service
public class Register 
{
    @Autowired
    UserRepo userRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    RoleRepo roleRepo;

    public String CheckUsers(User user, RedirectAttributes model)
    {
        User existedUser = userRepo.findByUsername(user.getUsername());

        if(existedUser == null)
        {
            String encryptPassword  = passwordEncoder.encode(user.getPassword());

            user.setPassword(encryptPassword);

            Role role = roleRepo.findByRoles("user");

            user.setRoles(role);
            
            userRepo.save(user);

            model.addAttribute("result", "Registered Successful");
            return "redirect:/login";

        } else
        {
            model.addAttribute("result", "The Username existed");
            return "redirect:/login";
        }
    }    

    public String CheckAdmin(User user, RedirectAttributes model)
    {
        User existedUser = userRepo.findByUsername(user.getUsername());

        if(existedUser == null)
        {
            String encryptPassword  = passwordEncoder.encode(user.getPassword());

            user.setPassword(encryptPassword);

            Role role = roleRepo.findByRoles("user");
            Role roles = roleRepo.findByRoles("admin");

            user.setRoles(role);
            user.setRoles(roles);
            
            userRepo.save(user);

            model.addAttribute("result", "Registered Successful");
            return "redirect:/login";

        } else
        {
            model.addAttribute("result", "The Username existed");
            return "redirect:/login";
        }
    }  
}
