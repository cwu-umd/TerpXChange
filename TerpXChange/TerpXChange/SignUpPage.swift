//
//  SignUpPage.swift
//  TerpXChange
//
//  Created by Hank Wu on 1/1/22.
//

import Foundation
import SwiftUI
import Firebase

struct SignUpPage: View {
    
    @State var new_username: String = ""
    @State var new_password: String = ""
    
    @State var errMessage: String? // default nil
    
    
    @State var pw_hidden: Bool = true
    
    
    // Relative Screen size
    var titleSize: CGFloat = UIScreen.main.bounds.width * 0.1
    var signupButtonW: CGFloat = UIScreen.main.bounds.width * 0.6
    var signupButtonH: CGFloat = UIScreen.main.bounds.height * 0.06

    
    var body: some View {

        VStack {
            
            Text("Create an Account")
                .font(.system(size: titleSize, weight: .bold))
                .italic()
            
            TextField("Username", text: $new_username)
                .padding(EdgeInsets(top: 20, leading: 35, bottom: 20, trailing: 0))
            
            Divider().padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            
            // Password
            HStack {
                if self.pw_hidden {
                    SecureField("Password", text: $new_password)
                        .padding(EdgeInsets(top: 20, leading: 35, bottom: 20, trailing: 0))
                } else {
                    TextField("Password", text: $new_password)
                        .padding(EdgeInsets(top: 20, leading: 35, bottom: 20, trailing: 0))
                }
                

                Button(action: {pw_hidden.toggle()}) {
                    Image(systemName: self.pw_hidden ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(self.pw_hidden ? Color.secondary : Color.blue)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
            }
            
            Divider().padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            
            // Error Message (TBI)
            if errMessage != nil {
                Text (errMessage!)
                    .foregroundColor(.red)
                    .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 0))
            }
            
            
            Button(action: {createUser(email: new_username, passwd: new_password)}) {
                Text("Create Account")
                    .frame(width: signupButtonW, height: signupButtonH, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(Capsule().stroke().fill(Color.black))
                    .foregroundColor(Color.black)
            }.padding()
            
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    func createUser (email: String, passwd: String) {
        
        let trimEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimPasswd = passwd.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().createUser(withEmail: trimEmail, password: trimPasswd) { (result, err) in
            
            if err != nil {
                // Errors thrown, show error messages!
                errMessage = err!.localizedDescription
                
            } else {
                // Successfully registered an user
                
                print("inside createUser function")
                print("the following is the result: \(result!.user.metadata)")
                
                Firestore.firestore().collection("accounts").document(result!.user.uid).setData(["Email" : email])
                
            }
            
        }
        
    }
    
    
    
    
    
}





struct SignUpPage_Preview: PreviewProvider {
    static var previews: some View {
//        SignUpPage().previewDevice("iPhone 12 Pro Max")
        SignUpPage().previewDevice("iPhone 8")

    }
}
