package car.application.car.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import car.application.car.Entity.User;
import car.application.car.Repository.UserRepo;

@Service
public class UserInfo
{
    @Autowired
    UserRepo userRepo;

    public Model FetchUserInfo(Model model, String userId)
    {
        User user = userRepo.findUserById(Long.valueOf(userId));

        model.addAttribute("user", user);
        model.addAttribute("admin", user.getRoles().size() == 2 ? true : false);

        return model;
    }
}
