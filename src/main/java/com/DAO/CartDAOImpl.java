package com.DAO;

import com.entity.Cart;
import com.entity.BookDetails;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl {
    
    private Connection conn;

    public CartDAOImpl(Connection conn) {
        this.conn = conn;
    }

    // Method to add a book to the cart in the database
    public boolean addToCart(int userId, int bookId) {
        String query = "INSERT INTO cart (user_id, book_id) VALUES (?, ?)";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, userId);
            pst.setInt(2, bookId);
            int result = pst.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to retrieve the cart for a specific user
    public Cart getCartByUserId(int userId) {
        Cart cart = new Cart();
        String query = "SELECT * FROM cart WHERE user_id = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                BookDetails book = getBookDetailsById(bookId); // Get book details from the database
                if (book != null) {
                    cart.addBook(book); // Add book to the cart
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

    // Helper method to get book details by ID
    private BookDetails getBookDetailsById(int bookId) {
        BookDetails book = null;
        String query = "SELECT * FROM books WHERE book_id = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, bookId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                book = new BookDetails();
                book.setId(rs.getInt("book_id"));
                book.setBookname(rs.getString("book_name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setPhotoName(rs.getString("photo_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    // Method to remove a book from the cart
    public boolean removeFromCart(int userId, int bookId) {
        String query = "DELETE FROM cart WHERE user_id = ? AND book_id = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, userId);
            pst.setInt(2, bookId);
            int result = pst.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to clear the entire cart for a user
    public boolean clearCart(int userId) {
        String query = "DELETE FROM cart WHERE user_id = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, userId);
            int result = pst.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get all cart items for a user
    public List<BookDetails> getAllCartItems(int userId) {
        List<BookDetails> cartItems = new ArrayList<>();
        String query = "SELECT * FROM cart WHERE user_id = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                BookDetails book = getBookDetailsById(bookId); // Get book details
                if (book != null) {
                    cartItems.add(book); // Add book to the cart
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }
}
