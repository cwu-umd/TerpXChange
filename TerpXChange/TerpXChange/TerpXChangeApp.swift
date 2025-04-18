//
//  TerpXChangeApp.swift
//  TerpXChange
//
//  Created by Hank Wu on 7/24/21.
//

import SwiftUI
import Firebase

@main
struct TerpXChangeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
//            LoginPage()
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application (_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Finished launching!")
        FirebaseApp.configure()
        return true
    }
        
}
