package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {

    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1, "Honda-CRV", 10000, "7 seats", "Honda"));
        productList.add(new Product(2, "Mercedes-C200", 30000, "4 seats", "Mer"));
        productList.add(new Product(3, "Audi-A7", 45000, "4 seats", "Audi"));
        productList.add(new Product(4, "Lexus-LX600", 1000000, "7 seats", "Lexus"));
        productList.add(new Product(5, "Porsche-Taycan", 900000, "7 seats", "Porsche"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public Product findById(int id) {
        return null;
    }

    @Override
    public boolean save(Product product) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}
