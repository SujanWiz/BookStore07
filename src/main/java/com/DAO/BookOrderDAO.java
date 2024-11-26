package com.DAO;

import com.entity.BookOrder;
import java.util.List;

public interface BookOrderDAO {

    // Method to place a new book order in the database
    boolean placeBookOrder(BookOrder order);

    // Method to get a specific order by its order ID
    BookOrder getOrderById(int orderId);

    // Method to get all orders placed by a specific user
    List<BookOrder> getOrdersByUserId(int userId);

    // Method to update an existing book order
    boolean updateBookOrder(BookOrder order);

    // Optional: Method to delete a book order by its order ID
    boolean deleteBookOrder(int orderId);
}
