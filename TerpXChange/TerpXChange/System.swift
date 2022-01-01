//
//  System.swift
//  terpxchange
//
//  Created by Alexander Quinto on 7/16/21.
//
import Foundation


public class System {
    
    private var users: [User]
    
    /*
     
     The users array will be empty when an instance of this class is created.
     
     */
    init() {
        self.users = []
    }
    
    //setters below
    
    public func addUser(user: User) {
        self.users.append(user)
    }
    
    //getters below
    
    public func getUsers() -> [User] {
        return self.users
    }
    
    public func getNumberOfUsers() -> Int {
        return self.users.count
    }
}
