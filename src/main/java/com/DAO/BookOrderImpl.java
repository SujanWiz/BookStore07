package com.DAO;

import com.DB.DBConnect;
import com.entity.BookOrder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookOrderDAOImpl {

    private Connection conn;

    public BookOrderDAOImpl(Connection conn) {
        this.conn = conn;
    }

    // Method to place a new book order into the database
    public boolean placeBookOrder(BookOrder order) {
        boolean result = false;
        String query = "INSERT INTO book_orders (user_id, book_title, author, quantity, price, total_amount) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            // Set parameters for the prepared statement
            stmt.setInt(1, order.getUserId()); // user_id
            stmt.setString(2, order.getBookTitle()); // book_title
            stmt.setString(3, order.getAuthor()); // author
            stmt.setInt(4, order.getQuantity()); // quantity
            stmt.setDouble(5, order.getPrice()); // price
            stmt.setDouble(6, order.getTotalAmount()); // total_amount

            // Execute the update and check if it's successful
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Method to fetch an order by its ID (if needed)
    public BookOrder getOrderById(int orderId) {
        BookOrder order = null;
        String query = "SELECT * FROM book_orders WHERE order_id = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, orderId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    order = new BookOrder();
                    order.setUserId(rs.getInt("user_id"));
                    order.setBookTitle(rs.getString("book_title"));
                    order.setAuthor(rs.getString("author"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setPrice(rs.getDouble("price"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    // Method to fetch all orders placed by a specific user
    public List<BookOrder> getOrdersByUserId(int userId) {
        List<BookOrder> orders = new ArrayList<>();
        String query = "SELECT * FROM book_orders WHERE user_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    BookOrder order = new BookOrder();
                    order.setUserId(rs.getInt("user_id"));
                    order.setBookTitle(rs.getString("book_title"));
                    order.setAuthor(rs.getString("author"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setPrice(rs.getDouble("price"));
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Optional method to update an existing order (if needed)
    public boolean updateOrder(BookOrder order) {
        boolean result = false;
        String query = "UPDATE book_orders SET book_title = ?, author = ?, quantity = ?, price = ?, total_amount = ? WHERE order_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, order.getBookTitle());
            stmt.setString(2, order.getAuthor());
            stmt.setInt(3, order.getQuantity());
            stmt.setDouble(4, order.getPrice());
            stmt.setDouble(5, order.getTotalAmount());
            stmt.setInt(6, order.getOrderId());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
