package com.DAO;

import java.util.List;
import com.entity.BookDetails;

public interface BookDAO {

    // Method to add a book
    boolean addBooks(BookDetails b);

    // Method to retrieve all books
    List<BookDetails> getAllBooks();

    // Method to get a book by its ID
    BookDetails getBookById(int id);

    // Method to update/edit a book
    boolean updateEditBooks(BookDetails b);

    // Method to delete a book by its ID
    boolean deleteBooks(int id);

    // Methods to retrieve books by categories
    List<BookDetails> getNewBook();
    List<BookDetails> getRecentBooks();
    List<BookDetails> getOldBooks();

    // Methods to retrieve all books by type
    List<BookDetails> getAllRecentBook();
    List<BookDetails> getAllNewBook();
    List<BookDetails> getAllOldBook();

    // Method to get books by user ID and category
    List<BookDetails> getBookByOld(int uid, String cate);
}
