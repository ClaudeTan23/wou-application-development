package car.application.car.Controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import car.application.car.Entity.User;
import car.application.car.Exception.CustomException;
import car.application.car.Repository.BiddingRepo;
import car.application.car.Repository.CarsRepo;
import car.application.car.Repository.UserRepo;
import car.application.car.Service.UserInfo;
import car.application.car.Entity.Bidding;
import car.application.car.Entity.Cars;

@Controller
public class Index extends CustomException
{
    @Autowired
    UserRepo userRepo;

    @Autowired
    UserInfo userInfo;

    @Autowired
    CarsRepo carsRepo;

    @Autowired
    BiddingRepo biddingRepo;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String Home(Model model, Authentication auth, Principal p)
    {
        if(p != null && auth != null)
        {
            userInfo.FetchUserInfo(model, p.getName());
        }

        return "index";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String About(Model model, Authentication auth, Principal p)
    {
        if(p != null && auth != null)
        {
            userInfo.FetchUserInfo(model, p.getName()); 
        }

        return "about";
    }

    @RequestMapping(value = "/cars", method = RequestMethod.GET)
    public String Cars(Model model, Authentication auth, Principal p)
    {
        List<Cars> cars = carsRepo.findAllCars(); 
        // List<User> s = new ArrayList<>(cars.get(0).getUsers());


        model.addAttribute("cars", cars);

        if(p != null && auth != null)
        {
            userInfo.FetchUserInfo(model, p.getName());
            

            // System.out.println(s.get(0).getUsername());
        }

        return "cars";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String Contact(Model model, Authentication auth, Principal p)
    {
        if(p != null && auth != null)
        {
            userInfo.FetchUserInfo(model, p.getName());
        }

        return "contact";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String Login()
    {
        return "login";
    }

    @RequestMapping(value = "/admin-register", method = RequestMethod.GET)
    public String AdminRegister()
    {
        return "admin-login";
    }

    @RequestMapping(value = "/car/{id}", method = RequestMethod.GET)
    public String Car(Model model, Authentication auth, Principal p, @PathVariable(name = "id") String id)
    {
        Cars car = carsRepo.findByCarId(id);
        model.addAttribute("car", car);

        if(car != null)
        {
            Long userId = Long.valueOf(car.getUserId());
            User user = userRepo.findUserById(userId);

            List<Bidding> bid = biddingRepo.findByCarId(id);
            model.addAttribute("owner", user);
            model.addAttribute("bid", bid);
        }

        if(p != null && auth != null)
        {
            userInfo.FetchUserInfo(model, p.getName());
        }

        return "car";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String Profile(Model model, Authentication auth, Principal p)
    {
        if(p != null && auth != null)
        {
            userInfo.FetchUserInfo(model, p.getName());
        }

        return "profile";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String Users(Model model, Authentication auth, Principal p)
    {
        if(p != null && auth != null)
        {
            userInfo.FetchUserInfo(model, p.getName());
        }

        return "users";
    }

    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
    public String User(@PathVariable("id") Long id)
    {
        return "user";
    }

    @RequestMapping(value = "/mycar", method = RequestMethod.GET)
    public String MyCar(Model model, Authentication auth, Principal p)
    {
        List<Cars> car = carsRepo.findByUserId(p.getName());

        model.addAttribute("cars", car);

        if(p != null && auth != null)
        {
            userInfo.FetchUserInfo(model, p.getName());
        }

        return "mycar";
    }

    @RequestMapping(value = "/myappointment", method = RequestMethod.GET)
    public String MyAppointment(Model model, Authentication auth, Principal p)
    {   
        if(p != null && auth != null)
        {
            userInfo.FetchUserInfo(model, p.getName());
        }

        return "myappointment";
    }

    @RequestMapping(value = "/deactivate", method = RequestMethod.POST)
    public String Deactivate(Model model, Authentication auth, Principal p, Cars b)
    {
        Cars cars = carsRepo.findByCarId(String.valueOf(b.getId()));
        cars.setActive("inactive");

        carsRepo.save(cars);

        return "redirect:./cars";
    }

    @RequestMapping(value = "/403")
    public String Forbidden()
    {
        return "403";
    }
    
}
