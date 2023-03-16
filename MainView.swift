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
                .popover(isPresented: /*@START_MENU_TOKEN@*/.constant(false)/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Popover Content@*/Text("Popover Content")/*@END_MENU_TOKEN@*/
                }
            
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
            VStack {
                VStack {
                    Text("Vilken färg är dina blodådror?").font(.title).multilineTextAlignment(.center)
                    HStack(spacing: 30) {
                        ForEach(0..<viewModel.options[0].count, id: \.self) { index in
                            Button(action: {
                                viewModel = viewModel.selectOption(at: 0, optionIndex: index)
                            }, label: {
                                Text(viewModel.options[0][index])
                            }).foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
                
                VStack {
                    Text("Vilken hårfärg har du?").font(.title).multilineTextAlignment(.center)
                    HStack(spacing: 30) {
                        ForEach(0..<viewModel.options[1].count, id: \.self) { index in
                            Button(action: {
                                viewModel = viewModel.selectOption(at: 1, optionIndex: index)
                            }, label: {
                                Text(viewModel.options[1][index])
                            }).foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
                
                VStack {
                    Text("Vilken metall passar du bäst i?").font(.title).multilineTextAlignment(.center)
                    HStack(spacing: 30) {
                        ForEach(0..<viewModel.options[2].count, id: \.self) { index in
                            Button(action: {
                                viewModel = viewModel.selectOption(at: 2, optionIndex: index)
                            }, label: {
                                Text(viewModel.options[2][index])
                            }).foregroundColor(.gray)
                        }
                    }
                }
                
                Spacer()
                
                if let result = viewModel.calculateResult() {
                    Text(result)
                } else {
                    Text(viewModel.calculateResult() ?? "Your true colors are...")
                }
                Spacer()
                
                VStack {
                    Button(action: {
                        viewModel = viewModel.resetTest()
                    }, label: {
                        Text("Reset test")
                            .fontWeight(.thin)
                            .foregroundColor(.green)
                    })
                }
            }
        }
        .frame(width: 300, height: 500, alignment: .center)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TheTest(viewModel: ViewModel())
    }
}
