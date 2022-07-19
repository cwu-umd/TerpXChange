//
//  UploadPost.swift
//  TerpXChange
//
//  Created by Hank Wu on 7/13/22.
//

import Foundation
import Firebase
import SwiftUI


struct uploadpost: View {
    
    @State var bookTitle = ""
    @State var bookCat = ""
    @State var className = ""
    @State var bookPrice = ""
    @State var bookDescription = "Book description..."
    
    var body: some View {
        
        VStack {
            
            Group {
                
                HStack {
                    
                    Button(action: {}){
                        Text("Cancel").padding()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        Text("Post")
                            .padding()
                    }
                }
                .foregroundColor(.red)
                .clipShape(Capsule())
                
            }
            
            Group {
                Divider()
                TextField("Book title (required)", text: $bookTitle)
                Divider()
                TextField("Class category", text: $bookCat)
                Divider()
                
                HStack {
                    TextField("Class name", text: $className)
                    Divider()
                    TextField("book price (require)", text: $bookPrice)
                }.frame(height: 25)
                
                Divider()
                
                TextEditor(text: $bookDescription)
                    .padding(.top, 2)
                    .foregroundColor(bookDescription == "Book description..." ? .gray : .primary)
                    .onTapGesture {
                        if bookDescription == "Book description..." {
                            bookDescription = ""
                        }
                    }
                
                Divider()
                
                
            }
            
            
            
        }
        
    }
    
}

struct uploadpost_preview: PreviewProvider {
    static var previews: some View {
        uploadpost().previewDevice("iPhone 12")
    }
}
