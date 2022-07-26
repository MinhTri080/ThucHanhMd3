package Thuc.controller;

import Thuc.dao.ProductDAO;
import Thuc.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/product")
public class ProductSeverlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    private String error = "";

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        try {
            switch (action) {
                case "update":
                    showUpdateForm(req, resp);
                    break;
                case "create":
                    showNewProduct(req, resp);
                    break;
                case "delete":

                    break;
                default:
                    listProduct(req, resp);
                    break;

            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        try {
            switch (action) {
                case "update":
                    updateProduct(req, resp);
                    break;
                case "create":
                    insertProduct(req, resp);
                    break;
                case "delete":
                    deleteProduct(req, resp);
                    break;
                default:
                    break;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response)  {
        System.out.println("listProduct");

        List<Product> listProduct = productDAO.selectAllProduct();
        request.setAttribute("listProduct", listProduct);
        System.out.println(listProduct);

     RequestDispatcher rq = request.getRequestDispatcher("/WEB-INF/product/list.jsp");
        try {
            rq.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }


    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("idproduct"));
        productDAO.deleteProduct(id);

        List<Product> listProduct = productDAO.selectAllProduct();
        request.setAttribute("listProduct", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("idproduct"));
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String des = request.getParameter("des");
        int category = Integer.parseInt(request.getParameter("category"));
//        int role = Integer.parseInt(request.getParameter("role"));
//        String passWord = request.getParameter("password");
//        System.out.printf("%d %s %s %d", id,name,email,idCountry);
        Product book = new Product(id, name, price, quantity, color, des, category);
        productDAO.updateProduct(book);
//
        response.sendRedirect("/product");
    }

    private void showNewProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
//        User user = new User();
        List<Product> product = productDAO.selectAllProduct();
        request.setAttribute("product", product);
        RequestDispatcher rq = request.getRequestDispatcher("/WEB-INF/product/create.jsp");
        rq.forward(request, response);
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        System.out.println("updateform");
        int id = Integer.parseInt(request.getParameter("idproduct"));
        System.out.println("test");
        Product existingProduct = productDAO.selectProduct(id);
        request.setAttribute("name", existingProduct.getName());
        request.setAttribute("price", existingProduct.getPrice());
        request.setAttribute("quantity", existingProduct.getQuantity());
        request.setAttribute("color", existingProduct.getColor());
        request.setAttribute("des", existingProduct.getDes());
        request.setAttribute("category", existingProduct.getCategory());
        System.out.println(existingProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/product/update.jsp");
        request.setAttribute("product", existingProduct);
        dispatcher.forward(request, response);


    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String des = request.getParameter("des");
        String category = request.getParameter("category");
        Product newProduct = new Product(name, price, quantity, category, des, Integer.parseInt(category));
        productDAO.insertProduct(newProduct);
        RequestDispatcher rq = request.getRequestDispatcher("/WEB-INF/product/register.jsp");
        rq.forward(request, response);
    }
}
