//
//  MainFeedPage.swift
//  TerpXChange
//
//  Created by Hank Wu on 7/6/22.
//

import Foundation
import SwiftUI

struct MainFeedPage: View {
    
    
    var body: some View {
        ScrollView {
            CardView(image: "9780367385040", price: "$34", title: "Intro to Linear Algebra", user: "Alex Chu", className: "MATH240", tag1: "MATH")
            //tag2: "Introductory Class"
                        CardView(image: "Introduction-To-Algorithms-Paperback-English-SDL474587042-1-8ecff", price: "$56", title: "Intro to Algorithms", user: "Hank Quinto", className: "CMSC351", tag1: "CMSC")
//                        CardView(image: "intro_to_ds_and_algos", price: "$45", title: "Intro to Data Struct. & Algorithms", user: "Eric Wu", className: "CMSC132", tag1: "CMSC", tag2: "Sophomore level")
//                        CardView(image: "mirror", price: "$30", title: "Living Room Mirror", user: "Steve Rogers", className: "Other", tag1: "Dorm", tag2: "Accessories")

            
        }
    }
    
}

struct ContentView_Preview : PreviewProvider {
    static var previews: some View {
        Group {
            MainFeedPage().previewDevice("iPod touch (7th generation)")
            MainFeedPage().previewDevice("iPhone 12")
        }
    }
}
