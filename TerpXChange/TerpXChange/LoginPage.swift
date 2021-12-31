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
    
    var iconSize: CGFloat = UIScreen.main.bounds.width * 0.16
    var titleSize: CGFloat = UIScreen.main.bounds.width * 0.103
    var newSignUp: CGFloat = UIScreen.main.bounds.width * 0.045
    var signinButtonW: CGFloat = UIScreen.main.bounds.width * 0.6
    var signinButtonH: CGFloat = UIScreen.main.bounds.height * 0.05    
    
    
    var body: some View {
        
        VStack{
            
            Spacer()

            HStack {
                Text("TerpXChange")
                    .font(.system(size: titleSize, weight: .bold))
                    .italic()
                
                Image("origami")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: iconSize, height: iconSize)
            }
            
            
            TextField("Username", text: $username)
//                .padding()
                .background(Color(.white))
                .cornerRadius(10.0)
                .padding(EdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 0))
            
            
            // Using padding instead of frame to maintain size across different screen
            Divider().padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            HStack {
                TextField("Password", text: $password)
//                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
                    .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                
                Button (action: {pwHidden.toggle()}) {
                    Image (systemName: self.pwHidden ? "eye.slash.fill" : "eye.fill").foregroundColor((self.pwHidden) ? Color.secondary : Color.blue)
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            
            Divider().padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
//            Error message to be shown here
            
            Button(action: {print("Logging in.....")}){
                Text("Sign In")
                    .frame(width: signinButtonW, height: signinButtonH, alignment: .center)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke().fill(Color.black))
                    .foregroundColor(.black)
            }.padding()
            
            Spacer()
            
            HStack {
                Text("New to TerpXChange? ").font(.system(size: newSignUp))
                
                Button (action: {}){
                    Text("Sign Up").font(.system(size: newSignUp))
                }
            }.padding(.vertical)
        
            
            
        }
//        End of V-Stack
        
        
    }
    
}










struct LoginPage_Preview: PreviewProvider {
    static var previews: some View {
//        LoginPage()
//            .previewDevice("iPod touch (7th generation)")
//
//        LoginPage()
//            .previewDevice("iPhone 8")
//
//        LoginPage()
//            .previewDevice("iPhone 8 Plus")
//
//        LoginPage()
//            .previewDevice("iPhone 12")

        LoginPage()
            .previewDevice("iPhone 12 Pro Max")
        
//        LoginPage()
//            .previewDevice("iPhone 11 Pro Max")
    }
}
