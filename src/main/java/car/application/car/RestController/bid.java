package car.application.car.RestController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import car.application.car.Entity.Bidding;
import car.application.car.Entity.Cars;
import car.application.car.Entity.Role;
import car.application.car.Entity.User;
import car.application.car.Repository.BiddingRepo;
import car.application.car.Repository.CarsRepo;
import car.application.car.Repository.RoleRepo;
import car.application.car.Repository.UserRepo;

@RestController
public class bid 
{
    @Autowired
    BiddingRepo biddingRepo;

    @Autowired
    UserRepo userRepo;

    @Autowired
    CarsRepo carsRepo;

    @Autowired
    RoleRepo roleRepo;

    @RequestMapping(value = "/post-bid", method = RequestMethod.POST)
    public Bidding BookBid(Bidding bid, Principal p)
    {
        User user = userRepo.findUserById(Long.valueOf(p.getName()));
        Cars cars = carsRepo.findByCarId(bid.getCarId());
        
        bid.setCars(cars);
        bid.setUserId(p.getName());
        bid.setResult("pending");
        bid.setUser(user);

        biddingRepo.save(bid);
        
        return bid;
    }    

    @RequestMapping(value = "/restcar/{id}", method = RequestMethod.GET)
    public List<Bidding> Car(Model model, Authentication auth, Principal p, @PathVariable(name = "id") String id)
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

            return bid;

        } else 
        {
            List<Bidding> bid = new ArrayList<Bidding>();
            return bid;
        }
    }

    @RequestMapping(value = "/restmyappointment", method = RequestMethod.GET)
    public List<Bidding> MyAppointment(Model model, Authentication auth, Principal p)
    {
        List<Bidding> bid = biddingRepo.findByUserId(p.getName());


        return bid;
    }

    @RequestMapping(value = "/approve-bid", method = RequestMethod.POST)
    public String ApproveBid(Model model, Authentication auth, Principal p, Bidding b)
    {
        Bidding bid = biddingRepo.findById(String.valueOf(b.getId()));
        bid.setResult(b.getResult());

        biddingRepo.save(bid);

        return "ok";
    }

    @RequestMapping(value = "/restusers", method = RequestMethod.GET)
    public List<User> Users(Model model, Authentication auth, Principal p)
    {
        List<User> user = userRepo.findAll();
        
        return user;
    }

    @RequestMapping(value = "/setadmin", method = RequestMethod.POST)
    public String SetAdmin(Model model, Authentication auth, Principal p, User u)
    {
        User user = userRepo.findUserById(Long.valueOf(u.getId()));
        Role role = roleRepo.findByRoles("admin");

        user.setRoles(role);

        userRepo.save(user);
        
        return "ok";
    }

}

