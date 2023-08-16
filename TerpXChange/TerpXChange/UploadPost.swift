//
//  UploadPost.swift
//  TerpXChange
//
//  Created by Hank Wu on 7/13/22.
//

import Foundation
import Firebase
import SwiftUI


struct UploadPost: View {
    
    @State var bookTitle = ""
    @State var bookCat = ""
    @State var className = ""
    @State var bookPrice = ""
    @State var bookDescription = "Book description..."
    
    @State var showAlert = false
    
    @State var image: UIImage?
//    = UIImage(systemName: "house")
    @State var images: [UIImage] = []
    
    @State var showActionSheet: Bool = false
    
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var showImagePicker: Bool = false
    
    var body: some View {
        
        ScrollView {
        
            VStack {
                
                Group {
                    
                    HStack {
                        
                        Button(action: {}){
                            Text("Cancel").padding()
                        }
                        
                        Spacer()
                        
                        Button(action: {
//                            showAlert.toggle()
                            post_operation()
                        }){
                            Text("Post")
                                .padding()
                                .alert(isPresented: $showAlert) {
                                    Alert(title: Text("Unable to post"), message: Text("please fill in all required fields"), dismissButton: nil)
                                }
                        }
                    }
                    .foregroundColor(.red)
                    .clipShape(Capsule())
                    
                }
                
                Group {
                    Divider()
                    TextField("Book title (required)", text: $bookTitle).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    Divider()
                    TextField("Class category", text: $bookCat).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    Divider()
                    
                    HStack {
                        TextField("ISBN", text: $className).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                        Divider()
                        TextField("book price (require)", text: $bookPrice).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    }.frame(height: 25)
                    
                    Divider()
                    
                    TextEditor(text: $bookDescription)
                        .frame(width: UIScreen.main.bounds.size.width, height: 150)
                        .onTapGesture {
                            if self.bookDescription == "Book description..." {
                                self.bookDescription = ""
                            }
                        }
                    
                    Divider()
                    
                    ScrollView (.horizontal, showsIndicators: false, content: {
                        
                        HStack (spacing: 15) {
                            
                            if image != nil {
                                Image (uiImage: image!)
                                    .resizable()
                                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                                    .frame(width: UIScreen.main.bounds.size.width, height: 250)
                            } else {
                                Text("No current image selected!")
                                    .frame(width: UIScreen.main.bounds.size.width)
                            }
                            
                            

    //                        ForEach (images, id: \.self) { img in
    //
    //                            Image (uiImage: img)
    //                                .resizable()
    //                                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
    //                        }
                            
                        }
                        
                    })
                    .frame(height: 250)
                    
                }
                
                Divider()
                
                Group {
                    HStack {
                        Text("Choose picture")
                            .font(.caption)
                        
                        Spacer()
                        
                        Button(action: {showActionSheet.toggle()}) {
                            Image(systemName: "camera")
                        }
                        .actionSheet(isPresented: $showActionSheet) {
                            ActionSheet(title: Text("Add a picture to your post"), message: nil, buttons:[
                                .default(Text("Camera"), action: {
                                    showImagePicker.toggle()
                                    sourceType = .camera
                                }),

                                .default(Text("Photo Library"), action: {
                                    showImagePicker.toggle()
                                    sourceType = .photoLibrary
                                }),

                                .cancel()

                            ])
                        }
                        
                        .sheet(isPresented: $showImagePicker) {
                            imagePicker(image: $image, showImagePicker: $showImagePicker, sourceType: sourceType)
                        }
                        
                        
                    }
    //                End of HStack
                }
    //            End of Group
                
                
                
                
            }
//            End of VStack
            
        }
        
    }
    
    
    
    
    func post_operation () -> Void {
        
//        [V] 1. Storing all textbook information to book_posts database
//        [V] 2. Adding textbook unique ID to specific account collection
//        [] 3. Uploading textbook images to firebase storage folder in path => /'textbookId'/.
        
        if let currentUser = Auth.auth().currentUser {
//            Current signed in account
            
            let db = Firestore.firestore()
            let bookDb = db.collection("book_posts")
            let userDb = db.collection("accounts")
            
            let uid = currentUser.uid
            let bookId = bookDb.document().documentID
            
            print(bookId)
            
//            Adding book info to textbook database
            bookDb
                .document(bookId)
                .setData(["description" : bookDescription,
                          "poster" : uid,
                          "price" : bookPrice,
                          "title" : bookTitle]) {
                    err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
            
            
//            Adding textbook ID under specific account
            userDb
                .document(uid)
                .collection("book_posts")
                .document(bookId)
            
            
            
        } else {
//            No current logged in account
            
            print("Error throw in UploadPost")
            print("No current logged in user!")
        }
        
        
        
        
    }
    
    
    
    
    
    
}

struct uploadpost_preview: PreviewProvider {
    static var previews: some View {
        UploadPost()
    }
}
