package com.entity;

import java.util.List;
import com.entity.BookDetails;

public class Cart {
    
    private int userId;                 // User ID for whom the cart is created
    private List<BookDetails> items;    // List of books (items) in the cart
    
    // Constructor
    public Cart(int userId, List<BookDetails> items) {
        this.userId = userId;
        this.items = items;
    }
    
    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<BookDetails> getItems() {
        return items;
    }

    public void setItems(List<BookDetails> items) {
        this.items = items;
    }

    // Add item to cart
    public void addItem(BookDetails book) {
        this.items.add(book);
    }

    // Remove item from cart
    public void removeItem(BookDetails book) {
        this.items.remove(book);
    }

    // Clear all items in the cart
    public void clearCart() {
        this.items.clear();
    }

    // Get total price of items in the cart
    public double getTotalPrice() {
        double total = 0;
        for (BookDetails book : items) {
            total += book.getPrice();
        }
        return total;
    }
    
    // Check if the cart is empty
    public boolean isEmpty() {
        return items.isEmpty();
    }
    
    // Convert cart to a string (for easy debugging)
    @Override
    public String toString() {
        return "Cart [userId=" + userId + ", items=" + items + "]";
    }
}
