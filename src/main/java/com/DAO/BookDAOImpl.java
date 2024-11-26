package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BookDAOImpl implements BookDAO {

    private Connection conn;

    // Constructor to initialize the connection
    public BookDAOImpl(Connection conn) {
        this.conn = conn;
    }

    // Method to add books to the database
    @Override
    public boolean addBooks(BookDetails b) {
        boolean f = false;
        try {
            String sql = "INSERT INTO book_details (bookname, author, price, bookcategory, status, photo, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, b.getBookname());
            ps.setString(2, b.getAuthor());
            ps.setDouble(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmail());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Method to fetch all books from the database
    @Override
    public List<BookDetails> getAllBooks() {
        List<BookDetails> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_details";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookDetails b = new BookDetails();
                b.setBookId(rs.getInt("id"));
                b.setBookname(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getDouble("price"));
                b.setBookCategory(rs.getString("bookcategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo"));
                b.setEmail(rs.getString("email"));

                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to fetch a book by its ID
    @Override
    public BookDetails getBookById(int id) {
        BookDetails b = null;
        try {
            String sql = "SELECT * FROM book_details WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                b = new BookDetails();
                b.setBookId(rs.getInt("id"));
                b.setBookname(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getDouble("price"));
                b.setBookCategory(rs.getString("bookcategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo"));
                b.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    // Method to update book details in the database
    @Override
    public boolean updateEditBooks(BookDetails b) {
        boolean f = false;
        try {
            String sql = "UPDATE book_details SET bookname=?, author=?, price=?, status=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, b.getBookname());
            ps.setString(2, b.getAuthor());
            ps.setDouble(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Method to delete a book from the database
    @Override
    public boolean deleteBook(int bookId) {
        boolean f = false;
        try {
            String sql = "DELETE FROM book_details WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookId);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Method to fetch recent books (Active status and sorted by id in descending order)
    @Override
    public List<BookDetails> getAllRecentBook() {
        List<BookDetails> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_details WHERE status=? ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookDetails b = new BookDetails();
                b.setBookId(rs.getInt("id"));
                b.setBookname(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getDouble("price"));
                b.setBookCategory(rs.getString("bookcategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo"));
                b.setEmail(rs.getString("email"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to fetch new books (Category "New" and Active status)
    @Override
    public List<BookDetails> getAllNewBook() {
        List<BookDetails> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_details WHERE bookcategory=? AND status=? ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookDetails b = new BookDetails();
                b.setBookId(rs.getInt("id"));
                b.setBookname(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getDouble("price"));
                b.setBookCategory(rs.getString("bookcategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo"));
                b.setEmail(rs.getString("email"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to fetch old books (Category "Old" and Active status)
    @Override
    public List<BookDetails> getAllOldBook() {
        List<BookDetails> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_details WHERE bookcategory=? AND status=? ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookDetails b = new BookDetails();
                b.setBookId(rs.getInt("id"));
                b.setBookname(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getDouble("price"));
                b.setBookCategory(rs.getString("bookcategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo"));
                b.setEmail(rs.getString("email"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
