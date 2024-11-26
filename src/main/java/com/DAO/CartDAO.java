package com.DAO;

import com.entity.BookDetails;
import com.DB.DBConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    private Connection conn;

    // Constructor to initialize the connection
    public CartDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to add a book to the cart
    public boolean addToCart(int userId, int bookId) {
        try {
            String query = "INSERT INTO cart (user_id, book_id) VALUES (?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, userId);
            pst.setInt(2, bookId);
            int result = pst.executeUpdate();
            return result > 0; // Return true if the book was added successfully
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to remove a book from the cart
    public boolean removeFromCart(int userId, int bookId) {
        try {
            String query = "DELETE FROM cart WHERE user_id = ? AND book_id = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, userId);
            pst.setInt(2, bookId);
            int result = pst.executeUpdate();
            return result > 0; // Return true if the book was removed successfully
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to clear the entire cart
    public boolean clearCart(int userId) {
        try {
            String query = "DELETE FROM cart WHERE user_id = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, userId);
            int result = pst.executeUpdate();
            return result > 0; // Return true if the cart was cleared
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to retrieve all books in the cart for a specific user
    public List<BookDetails> getAllCartItems(int userId) {
        List<BookDetails> cartItems = new ArrayList<>();
        try {
            String query = "SELECT * FROM cart WHERE user_id = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                BookDetails book = getBookDetailsById(bookId); // Fetch book details by ID
                cartItems.add(book); // Add the book to the list
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    // Helper method to retrieve book details by book ID
    private BookDetails getBookDetailsById(int bookId) {
        BookDetails book = new BookDetails();
        try {
            String query = "SELECT * FROM books WHERE book_id = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, bookId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
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

    // Method to get the cart by user ID (returns the entire cart object)
    public List<BookDetails> getCartByUserId(int userId) {
        List<BookDetails> cartItems = new ArrayList<>();
        try {
            String query = "SELECT * FROM cart WHERE user_id = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                BookDetails book = getBookDetailsById(bookId);
                cartItems.add(book); // Add book to the cart list
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    // Method to delete multiple books from the cart
    public boolean deleteBooks(int userId, List<Integer> bookIds) {
        try {
            if (bookIds == null || bookIds.isEmpty()) {
                return false; // No books to delete
            }

            StringBuilder query = new StringBuilder("DELETE FROM cart WHERE user_id = ? AND book_id IN (");
            for (int i = 0; i < bookIds.size(); i++) {
                query.append("?");
                if (i < bookIds.size() - 1) {
                    query.append(", ");
                }
            }
            query.append(")");

            PreparedStatement pst = conn.prepareStatement(query.toString());
            pst.setInt(1, userId);

            for (int i = 0; i < bookIds.size(); i++) {
                pst.setInt(i + 2, bookIds.get(i)); // Set book IDs in the query
            }

            int result = pst.executeUpdate();
            return result > 0; // Return true if books were deleted
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
