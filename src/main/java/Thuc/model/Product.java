package Thuc.model;

public class Product {
    private int idproduct;
    private String name;
    private double price;
    private int quantity;
    private String color;
    private String des;
    private int category;

    public Product() {
    }

    public Product(String name, double price, int quantity, String color, String des, int category) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.des = des;
        this.category = category;
    }

    public Product(int idproduct, String name, double price, int quantity, String des, int category) {
        this.idproduct = idproduct;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.des = des;
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "idproduct=" + idproduct +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", color='" + color + '\'' +
                ", des='" + des + '\'' +
                ", category='" + category + '\'' +
                '}';
    }

    public Product(int idproduct, String name, double price, int quantity, String color, String des, int category) {
        this.idproduct = idproduct;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.des = des;
        this.category = category;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getIdproduct() {
        return idproduct;
    }

    public void setIdproduct(int idproduct) {
        this.idproduct = idproduct;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String describe) {
        this.des = describe;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

}

