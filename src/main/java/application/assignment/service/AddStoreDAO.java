package application.assignment.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import application.assignment.entity.StoreEntity;

@Service
public class AddStoreDAO
{
    public List<StoreEntity> stores = new ArrayList<StoreEntity>();

    public List<StoreEntity> getStores()
    {
        return stores;
    }

    public void addStores(StoreEntity store)
    {
        stores.add(store);
        System.out.println("store added.");
    }

}
