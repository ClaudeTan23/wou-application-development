package car.application.car.Controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import car.application.car.Entity.Cars;
import car.application.car.Repository.CarsRepo;
import car.application.car.Service.UserInfo;

@Controller
public class SearchController 
{
    @Autowired
    CarsRepo carsRepo;

    @Autowired
    UserInfo userInfo;

    @RequestMapping(value = "/cars/{col}", method = RequestMethod.GET)
    public String SearchCars(Model model, Authentication auth, Principal p, @RequestParam String val, @PathVariable(name = "col") String col)
    {
        List<Cars> cars;

        String column = String.valueOf(col.trim());

        if(column.equals("makeby"))
        {
            cars = carsRepo.searchMakeBy(val);

        } else if(column.equals("model")) 
        {
            cars = carsRepo.searchModel(val);

        } else if(column.equals("price"))
        {
            cars = carsRepo.searchPrice(val);

        } else if(column.equals("registration"))
        {
            cars = carsRepo.searchRegistration(val);

        } else 
        {
            cars = carsRepo.findAllCars();
        }

        model.addAttribute("cars", cars);

        if(p != null && auth != null)
        {
            userInfo.FetchUserInfo(model, p.getName());
            

            // System.out.println(s.get(0).getUsername());
        }
        
        return "cars";
    }
}
