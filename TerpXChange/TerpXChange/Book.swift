//
//  Book.swift
//  terpxchange
//
//  Created by Alexander Quinto on 7/16/21.
//
import Foundation
import SwiftUI
public class Book {
    private var bookTitle: String
    private var bookImages: [UIImage]
    private var bookDescription: String
    private var price: Int
    private var tags: [String]
    
    
    /*
     
     The tags and images arrays will be set to an empty one when a new Book instance is created.
     These can be added using their respective functions addTag() and addImage().
     
     */
    init(bookTitle: String, bookDescription: String, price: Int){
        self.bookTitle = bookTitle
        self.bookDescription = bookDescription
        self.price = price
        self.tags = []
        self.bookImages = []
    }
    // setter functions are below
    public func setTitle(title: String) {
        self.bookTitle = title
    }
    
    public func setPrice(price: Int) {
        self.price = price
    }
    
    public func addTag(tag: String) {
        self.tags.append(tag)
    }
    
    public func addImage(image: UIImage) {
        self.bookImages.append(image)
    }
    
    
    public func setBookDescription(description: String) {
        self.bookDescription = description
    }
    
    // getter functions are below
    public func getTitle() -> String {
        return self.bookTitle
    }
    
    public func getDescription() -> String {
        return self.bookDescription
    }
    
    public func getPrice() -> Int {
        return self.price
    }
    
    public func getTags() -> [String] {
        return self.tags
    }
    
    public func getImages() -> [UIImage] {
        return self.bookImages
    }
}
