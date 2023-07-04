package car.application.car.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import car.application.car.Entity.Bidding;
import car.application.car.Entity.BookTest;
import car.application.car.Entity.Cars;
import car.application.car.Repository.BookTestRepo;
import car.application.car.Repository.CarsRepo;

@Controller
public class UploadController
{
    @Autowired
    CarsRepo carsRepo;

    @Autowired
    BookTestRepo bookTestRepo;

    @RequestMapping(value = "/upload-car", method = RequestMethod.POST)
    public String Cars(@RequestParam("car-image") MultipartFile file, Cars cars, Principal p) throws IOException, InterruptedException 
    {
        StringBuilder fileNames = new StringBuilder();
        String txt = String.valueOf(System.currentTimeMillis());
        Path filePath = Paths.get(System.getProperty("user.dir"), "src", "main", "resources", "static", "image");
        if(Files.notExists(filePath)) Files.createDirectory(filePath);

        if(Files.notExists(Paths.get(filePath.toString(), file.getOriginalFilename()))) Files.write(Paths.get(filePath.toString(), txt + ".png"), file.getBytes());
        
        cars.setImage(txt + ".png");
        cars.setUserId(p.getName());
        cars.setActive("active");

        carsRepo.save(cars);

        TimeUnit.SECONDS.sleep(2);
        return "redirect:/cars";
    }

    @RequestMapping(value = "/book-test", method = RequestMethod.POST)
    public String BookTest(Cars cars, Principal p, BookTest b)
    {
        BookTest book = b;
        book.setUserId(p.getName());

        bookTestRepo.save(book);
        
        return "redirect:/cars";
    }

    // @RequestMapping(value = "/book-bid", method = RequestMethod.POST)
    // public String BookBid(Bidding bid, Principal p)
    // {
        
    //     return "redirect:/cars";
    // }
}
