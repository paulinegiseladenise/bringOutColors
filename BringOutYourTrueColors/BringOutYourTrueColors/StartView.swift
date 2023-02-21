//
//  ContentView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-02-01.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel: ViewModel
    
    @State var isShowingMainView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Bring out your").font(.title2).fontWeight(.bold)
                Text("true colors").font(.title).fontWeight(.bold)
                
                NavigationLink(destination: MainView()) {
                    Text("Välkommen in")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
