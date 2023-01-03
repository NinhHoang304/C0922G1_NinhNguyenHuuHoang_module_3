package service.impl;

import model.Product;
import service.IProductService;

import java.util.List;

public class ProductServiceImpl implements IProductService {

    private static List<Product> productList;

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
        return productList.get(id);
    }

    @Override
    public void update(Product product) {
        productList.add(product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }
}