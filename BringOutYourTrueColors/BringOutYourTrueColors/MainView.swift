//
//  HomepageView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-02-01.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Text("It is time to find out if your true colors are warm or cool.")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            NavigationLink(destination: TheTest(viewModel: ViewModel())) {
                Text("Start the test")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

struct TheTest: View {
    
    @State var viewModel = ViewModel()
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Spacer()
            VStack(spacing: 50) {
                Text("Vilken färg är dina blodådror?").font(.title)
                HStack(spacing: 10) {
                    ForEach(0..<viewModel.options[0].count, id: \.self) { index in
                        Button(action: {
                            viewModel.selections[0] = index
                        }, label: {
                            Text(viewModel.options[0][index])
                        }).foregroundColor(.gray)
                    }
                }
                
                VStack(spacing: 50) {
                    Text("Vilken hårfärg har du?").font(.title)
                    HStack(spacing: 10) {
                        ForEach(0..<viewModel.options[1].count, id: \.self) { index in
                            Button(action: {
                                viewModel.selections[1] = index
                            }, label: {
                                Text(viewModel.options[1][index])
                            }).foregroundColor(.gray)
                        }
                    }
                    
                    VStack(spacing: 50) {
                        Text("Vilken metall passar du bäst i?").font(.title)
                        HStack(spacing: 40) {
                            ForEach(0..<viewModel.options[2].count, id: \.self) { index in
                                Button(action: {
                                    viewModel.selections[2] = index
                                }, label: {
                                    Text(viewModel.options[2][index])
                                }).foregroundColor(.gray)
                            }
                        }
                    }
                }
                Spacer()
                Text(viewModel.calculateResult())
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TheTest(viewModel: ViewModel())
    }
}
