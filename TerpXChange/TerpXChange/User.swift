//
//  User.swift
//  terpxchange
//
//  Created by Alexander Quinto on 7/16/21.
//
import Foundation

public class User {
    private var fName: String
    private var lName: String
    private var userName: String
    private var userBio: String
    private var age: Int
    private var email: String
    private var UID: Int
    private var books: [Book]
    
    
    /*
     
     The books array will be set to an empty one when a new user is created.
     You can add a book to the books array using the addBook() function.
     
     */
    init(fName: String, lName: String, userBio: String, age: Int, email: String, UID: Int, userName: String) {
        self.fName = fName
        self.lName = lName
        self.userBio = userBio
        self.age = age
        self.email = email
        self.UID = UID
        self.books = []
        self.userName = userName
    }
    
    //setters are below
    public func setUsername(userName: String) {
        self.userName = userName
    }
    
    public func setName(first: String, last: String) {
        if first.isEmpty {
            print("Error")
        }
        self.fName = first
        if last.isEmpty == false {
            self.lName = last
        }
    }
    
    public func changeBio(bio: String) {
        self.userBio = bio
    }
    
    public func setAge(age: Int) {
        self.age = age
    }
    
    public func setEmail(email: String) {
        self.email = email
    }
    
    public func setUID(UID: Int) {
        self.UID = UID
    }
    
    public func addBook(book: Book) {
        self.books.append(book)
    }
    
    //getters functions below
    
    public func getFullName() -> String {
        return self.fName + " " + self.lName
    }
    
    public func getBio() -> String {
        return self.userBio
    }
    
    public func getAge() -> Int {
        return self.age
    }
    
    public func getEmail() -> String {
        return self.email
    }
    
    public func getUID() -> Int {
        return self.UID
    }
    
    public func getBooks() -> [Book] {
        return self.books
    }
    
    public func getUsername() -> String {
        return self.userName
    }
    
}
