package com.controller;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import java.sql.Connection;
import java.util.Scanner;

public class RemoveBookFromCart {

    public static void main(String[] args) {
        // Establish the database connection
        Connection conn = DBConnect.getConnection();
        CartDAOImpl cartDAO = new CartDAOImpl(conn);
        
        // Scanner to read user input
        Scanner scanner = new Scanner(System.in);
        
        // Input: User ID and Book ID to remove from cart
        System.out.println("Enter User ID: ");
        int userId = scanner.nextInt();
        
        System.out.println("Enter Book ID to remove from cart: ");
        int bookId = scanner.nextInt();
        
        // Attempt to remove the book from the cart
        boolean isRemoved = cartDAO.removeFromCart(userId, bookId);
        
        // Provide feedback to the user
        if (isRemoved) {
            System.out.println("Book with ID " + bookId + " has been successfully removed from the cart.");
        } else {
            System.out.println("Failed to remove the book. Please check if the book exists in the cart or try again later.");
        }
        
        // Close scanner resource
        scanner.close();
    }
}
