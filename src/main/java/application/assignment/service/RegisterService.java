package application.assignment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import application.assignment.entity.RoleEntity;
import application.assignment.entity.UserEntity;
import application.assignment.repository.RoleRepository;
import application.assignment.repository.UserRepository;

@Service
public class RegisterService 
{
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private RoleRepository roleRepo;

    public String register(Model model, UserEntity user, UserRepository userRepo, RedirectAttributes redirect)
    {
        
        if(userRepo.findByUsername(user.getUsername()) != null)
        {
            redirect.addFlashAttribute("register_error", "Username existed");
            
            return "redirect:login";

        } else 
        {
            String encryptPassword = passwordEncoder.encode(user.getPassword());

            RoleEntity roleView = roleRepo.findByName("VIEW_STORE");
            RoleEntity roleAdd = roleRepo.findByName("ADD_STORE");
            
            user.setRoles(roleView);
            user.setRoles(roleAdd);
            user.setPassword(encryptPassword);
            userRepo.save(user);

            return "redirect:get-store";
        }
    }    
}
