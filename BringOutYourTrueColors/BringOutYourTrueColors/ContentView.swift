//
//  ContentView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-02-01.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel: ViewModel
    @State var selectedTab: Tab = .lightbulb
    
    var body: some View {
        NavigationView {
                StartView()
        }
    }
}

struct StartView: View {
    
    var body: some View {
//            NavigationLink(destination: MainView()) {
                Text("THEIA")
                    .font(.largeTitle)
                    .fontDesign(.serif)
                    .foregroundColor(.black)
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
