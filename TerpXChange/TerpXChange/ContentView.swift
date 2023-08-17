//
//  ContentView.swift
//  TerpXChange
//
//  Created by Hank Wu on 7/24/21.
//

import SwiftUI
import Firebase


struct ContentView: View {
    
    @State var userIsSignedIn = true
    
    @State var tabSelected = 0
    
    @State var tabViewIcon = [("house","house.fill"), ("message.circle","message.circle.fill"), ("plus.circle.fill",""), ("questionmark.app.dashed","questionmark.app.fill"), ("person.circle","person.circle.fill")]
    
    
    var tabIconSize:CGFloat = UIScreen.main.bounds.width


    
    var body: some View {
        
        if userIsSignedIn {
            content
        } else {
            LoginPage()
        }

    }
    
    
    var content: some View {
        
        // Elements overley
        ZStack {
            
            // Custom tab view
            VStack {

                switch tabSelected {
                    
                case 0:
                        MainFeedPage()
                case 1:
                    NavigationView{
                        Text("Message Page (To be implemented)")
                    }
                case 2:
                    UploadPost()
                case 3:
                    NavigationView {
                        Text("Coming soon")
                    }
                case 4:
//                    NavigationView {
                        Text("Profile Page (To be implemented)")

                        Button (action: {
                            print("siging out a user")

                            do {
                                try Auth.auth().signOut()
                            } catch let signOutError as NSError {
                                print("Error signing out: %@", signOutError)
                            }
                            

                        }, label: {
                            Text("Sign Out")
                        })
                        
//                    }
                default:
                    MainFeedPage()
                }
                
                Spacer()
                Divider().frame(height: 1)
                HStack {
                    
                    ForEach(0..<5) { num in
                        
                        Spacer()
                            
                            Button(action: {
                                
                                tabSelected = num
                                
                            }, label: {
                                if num == 2 {
                                    Image(systemName: tabViewIcon[num].0)
                                        .font(.system(size:tabIconSize * 0.15, weight: .bold))
                                        .foregroundColor(.blue)
                                } else {
                                    Image(systemName: tabSelected != num ? tabViewIcon[num].0 : tabViewIcon[num].1)
                                        .font(.system(size:tabIconSize * 0.08, weight: .bold))
                                        .foregroundColor(.black)
                                }
                            })
                        
                        Spacer()
                        
                    }
                }
            }
        }
        .onAppear {
            
            Auth.auth().addStateDidChangeListener { auth, user in
                if user == nil {
                    
                    print("this is in contentview page")
                    print(user)
                    print(user?.uid)
                    
                    userIsSignedIn.toggle()
                }
            }
            
        }
        
    }
    
    
}





//struct searchButton: View {
//
//    @State var show = false
//
//    var body: some View {
//
//        VStack{
//
//
//            Button (action: {
//                show.toggle()
//            }) {
//                Image (systemName: "magnifyingglass")
//                    .resizable()
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//                    .padding()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 55, height: 50)
//            }
//            .background(Color.red)
//            .mask(Circle())
//            .shadow(color: .blue, radius: 20, x: 0, y: 0)
//
//        }
//
//    }
//
//}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPod touch (7th generation)")
    }
}

