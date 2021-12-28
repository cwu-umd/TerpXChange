//
//  LoginPage.swift
//  TerpXChange
//
//  Created by Hank Wu on 12/28/21.
//

import Foundation
import SwiftUI
import Firebase

struct LoginPage: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var pwHidden: Bool = true
    
    
    
    var body: some View {
        
        
        VStack{
            
            Spacer()
            
            HStack {
                Text("TerpXChange").font(.system(size: 40, weight: .bold, design: .default)).bold().italic().foregroundColor(Color.black).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                Image("origami").resizable().aspectRatio(contentMode: .fill).frame(width: 60, height: 60)
            }
            
//            HStack {
                TextField("Username", text: $username).padding().background(Color(.white)).cornerRadius(10.0).padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
//            }
            
            Divider().frame(width: 350)
            
            HStack {
                TextField("Password", text: $password).padding().background(Color(.white)).cornerRadius(10.0).padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                
                Button (action: {pwHidden.toggle()}) {
                    Image (systemName: self.pwHidden ? "eye.slash.fill" : "eye.fill").foregroundColor((self.pwHidden) ? Color.secondary : Color.blue)
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
            }
            
            Divider().frame(width: 350)
            
//            Error message to be shown here
            
            Button(action: {print("Logging in.....")}){
                Text("Sign In")
                    .frame(width: 250, height: 50, alignment: .center)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke().fill(Color.black))
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            HStack {
                Text("New to TerpXChange? ").font(.system(size: 15))
                
                Button (action: {}){
                    Text("Sign Up")
                }
            }.padding(.vertical)
        
            
            
        }
//        End of V-Stack
        
        
    }
    
}





struct LoginPage_Preview: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
