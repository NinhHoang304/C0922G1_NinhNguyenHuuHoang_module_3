package service.impl;

import model.Product;
import service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements IProductService {

    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Iphone X", 500, "Black", "Apple"));
        productList.add(new Product(2, "Iphone XS", 1000, "Gold", "Apple"));
        productList.add(new Product(3, "Iphone 11", 1500, "Rose", "Apple"));
        productList.add(new Product(4, "Iphone 12", 2000, "White", "Apple"));
        productList.add(new Product(5, "Iphone 13", 3000, "Blue", "Apple"));
        productList.add(new Product(6, "Iphone 14", 3500, "Purple", "Apple"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public Product findById(int id) {
        for (Product pro : productList) {
            if (pro.getId() == id) {
                return pro;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id){
                productList.set(i, product);
                return;
            }
        }
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }
}
