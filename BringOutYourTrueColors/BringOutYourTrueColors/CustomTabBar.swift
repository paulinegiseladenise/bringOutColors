//
//  CustomTabBar.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-03-22.
//

import SwiftUI

enum Tab: Int {
    case house, book, lightbulb, questionmark, colors
}

struct CustomTabBar: View {
    
    @State var selectedTab = Tab.house
    
    var body: some View {
        TabView(selection: $selectedTab) {
            StartView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(Tab.house)
            
            MainView()
                .tabItem {
                    Image(systemName: "book")
                }
                .tag(Tab.book)
            
            TheTest()
                .tabItem {
                    Image(systemName: "questionmark")
                }
                .tag(Tab.questionmark)
            
            ResultView()
                .tabItem {
                    if selectedTab == .colors {
                        Image("Rainbow")
                    } else {
                        Image("Gray")
                    }
                }
                .tag(Tab.colors)
            
            ColorChoiceView()
                .tabItem {
                    Image(systemName: "lightbulb")
                }
                .tag(Tab.lightbulb)
        }
        .accentColor(Color.black)
    }
}


