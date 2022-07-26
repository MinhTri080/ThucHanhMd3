package Thuc.dao;

import Thuc.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductDAO {
    public void insertProduct(Product product) throws SQLException;



    Product selectProduct(int id);

    public List<Product> selectAllProduct();
    public List<Product> selectProductPagging(int offset,int noOfRecords);
    boolean existByProductname(String productname);
    boolean existByProductId(long userId);


    public boolean deleteProduct(int id) throws SQLException;

    public boolean updateProduct(Product product) throws SQLException;
    List<Product> findNameProduct(String query) throws SQLException;
}
