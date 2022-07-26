package Thuc.dao;

import Thuc.connect_MySQL.ConnectMySQL;
import Thuc.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO {
    ConnectMySQL connectionMySQL = new ConnectMySQL();
    Connection connection = connectionMySQL.getConnection();
    private int noOfRecords;
public ProductDAO(){

}
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO product (name,price,quantity,color,des,category) VALUES ( ? , ? , ? , ?,?,?);";
    private static final String SELECT_PRODUCT_BY_ID = "select * from product where idproduct = ?;";
    private static final String SELECT_ALL_PRODUCT = "select * from product;";
    private static final String DELETE_PRODUCT_SQL = "delete from product where idproduct = ?;";
    private static final String UPDATE_PRODUCT_SQL = "update product set name = ? ,price = ? ,quantity = ?  ,color  = ? ,des = ? ,category =?  where idproduct = ?;";


    @Override
    public void insertProduct(Product product) throws SQLException {
        Connection connection = connectionMySQL.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL);

//            preparedStatement.setLong(1, product.getId());
        preparedStatement.setString(1, product.getName());
        preparedStatement.setDouble(2, product.getPrice());
        preparedStatement.setInt(3, product.getQuantity());
        preparedStatement.setString(4, product.getColor());
        preparedStatement.setString(5, product.getDes());
        preparedStatement.setInt(6, product.getCategory());

        System.out.println(this.getClass() + " insertProduct() query: " + preparedStatement);
        preparedStatement.executeUpdate();
        connection.close();
    }


    @Override
    public Product selectProduct(int id) {
        System.out.println("selecproduct");
        Product product = new Product();
        try (Connection connection = connectionMySQL.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idproduct = rs.getInt("idproduct");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                String des = rs.getString("des");
                int category = rs.getInt("category");
//                int role = rs.getInt("role");

                product = new Product(idproduct, name, price, quantity, color, des, category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> selectAllProduct() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = connectionMySQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int productid = rs.getInt("idproduct");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String des = rs.getString("des");
                int category = rs.getInt("category");

                products.add(new Product(productid, name, price, quantity, des, category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

//    public static void main(String[] args) {
//        ProductDAO product = new ProductDAO();
//        product.selectAllProduct();
//        System.out.println(product.selectAllProduct());

//    }
public List<Product> getNumberPage(int offset, int noOfRecords, String name) throws ClassNotFoundException, SQLException {
    Connection connection = connectionMySQL.getConnection();
    System.out.println("numberpage");

    String query = "SELECT SQL_CALC_FOUND_ROWS * FROM product where name LIKE ? OR price LIKE ? OR quantity LIKE ? order by createdate desc limit " + offset + ", " + noOfRecords;
    List<Product> list = new ArrayList<>();
    PreparedStatement ps = connection.prepareStatement(query);
    ps.setString(1, '%' + name + '%');
    ps.setString(2, '%' + name + '%');
    ps.setString(3, '%' + name + '%');

    System.out.println(this.getClass() + " getNumberPage() query: " + ps);
    ResultSet rs = ps.executeQuery();
    while (rs.next()){
        Product product = new Product();
        product.setIdproduct(rs.getInt("idproduct"));
        product.setName(rs.getString("name"));
        product.setPrice(rs.getDouble("price"));
        product.setQuantity(rs.getInt("quantity"));
        product.setColor(rs.getString("color"));
        product.setDes(rs.getString("des"));
        product.setCategory(rs.getInt("category"));
//            user.setAddress(rs.getString("address"));
//            user.setPhone(rs.getString("phone"));
//            user.setEmail(rs.getString("email"));
        list.add(product);
    }
    rs = ps.executeQuery("SELECT FOUND_ROWS()");
    if (rs.next()){
        this.noOfRecords = rs.getInt(1);
    }
    connection.close();
    return list;
}
    public int getNoOfRecords() {
        return noOfRecords;
    }
    @Override
    public List<Product> selectProductPagging(int offset, int noOfRecords) {
        return null;
    }

    @Override
    public boolean existByProductname(String productname) {
        return false;
    }

    @Override
    public boolean existByProductId(long userId) {
        return false;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = connectionMySQL.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = connectionMySQL.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL);) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setString(4, product.getColor());
            statement.setString(5, product.getDes());
            statement.setInt(6, product.getCategory());
//            statement.setInt(3, user.getIdCountry());
            statement.setInt(7, product.getIdproduct());


            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public List<Product> findNameProduct(String query) throws SQLException {
        return null;
    }
}
