//
//  HomepageView.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-02-01.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        VStack(alignment: .center) {
            VStack(spacing: 30) {
                Spacer()
                Text("'Can I change my haircolor to red if my colors are cool?'")
                    .multilineTextAlignment(.leading)
                Spacer()
                Text("'I want to wear blue clothes but aren't sure if I can because I have warm colors...'")
                    .multilineTextAlignment(.center)
                Spacer()
                Text("'Is it possible to combine gray and beige?'")
                    .multilineTextAlignment(.trailing)
                Spacer()
            }.frame(width: 300, height: 350)
            
            Text("The questions can be many and this app will guide you how to uplift your true colors.")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            NavigationLink(destination: TheTest(viewModel: ViewModel())) {
                Text("Start the test")
                    .bold()
                    .frame(width: 200, height: 50)
                    .foregroundColor(.black)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(radius: 3)
            }
                Spacer()
        }
    }
}

struct TheTest: View {
    
    @State var viewModel = ViewModel()
    @State var showCircle = false
    
    var body: some View {
        ZStack {
            testView()
            showResultView()
        }
    }
    
    @ViewBuilder func testView() -> some View {
        ZStack {
            VStack {
                
                Spacer()
                        VStack(spacing: 10) {
                            Text("Vilken färg är dina blodådror?").font(.title).multilineTextAlignment(.center)
                            VStack(spacing: 10) {
                                ForEach(0..<viewModel.options[0].count, id: \.self) { index in
                                    Button(action: {
                                        viewModel = viewModel.selectOption(at: 0, optionIndex: index)
                                    }, label: {
                                        Text(viewModel.options[0][index])
                                    }).foregroundColor(viewModel.optionSelected(optionIndex: index, at: 0) ? Color.black : Color.gray)
                                        .disabled(viewModel.allSelectionsMade)
                                }
                            }
                        }
                        Spacer()
                        
                        VStack(spacing: 10) {
                            Text("Vilken hårfärg har du?").font(.title).multilineTextAlignment(.center)
                            VStack(spacing: 10) {
                                ForEach(0..<viewModel.options[1].count, id: \.self) { index in
                                    Button(action: {
                                        viewModel = viewModel.selectOption(at: 1, optionIndex: index)
                                    }, label: {
                                        Text(viewModel.options[1][index])
                                    }).foregroundColor(viewModel.optionSelected(optionIndex: index, at: 1) ? Color.black : Color.gray)
                                }
                            }
                        }
                        Spacer()
                        
                        VStack(spacing: 10) {
                            Text("Vilken metall passar du bäst i?").font(.title).multilineTextAlignment(.center)
                            VStack(spacing: 10) {
                                ForEach(0..<viewModel.options[2].count, id: \.self) { index in
                                    Button(action: {
                                        viewModel = viewModel.selectOption(at: 2, optionIndex: index)
                                    }, label: {
                                        Text(viewModel.options[2][index])
                                    }).foregroundColor(viewModel.optionSelected(optionIndex: index, at: 2) ? Color.black : Color.gray)
                                }
                            }
                        }
                        Spacer()
                    }
                    .blur(radius: viewModel.calculateResult() != nil ? 20 : 0)
        }
        .frame(width: 330, height: 400, alignment: .center)
    }
    
    @ViewBuilder func showResultView() -> some View {
        VStack(spacing: 30) {
            if let result = viewModel.calculateResult() {
                
                if result == "You have warm colors" {
                    VStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.linearGradient(colors: [.yellow, .green, .red],
                                                             startPoint: .top,
                                                             endPoint: .bottom))
                        Text(result).font(.title).multilineTextAlignment(.center)
                    }
                } else if result == "You have cool colors" {
                    VStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.linearGradient(colors: [.purple, .blue, .pink],
                                                             startPoint: .top,
                                                             endPoint: .bottom))
                        Text(result).font(.title).multilineTextAlignment(.center)
                    }
                } else if result == "You have both warm and cool colors" {
                    VStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.linearGradient(colors: [.brown, .white, .black],
                                                             startPoint: .top,
                                                             endPoint: .bottom))
                        Text(result).font(.title).multilineTextAlignment(.center)
                    }
                }
            }
            
            if viewModel.calculateResult() != nil {
                VStack {
                    NavigationLink(destination: ResultView()) {
                        Text("Find out more here")
                            .bold()
                            .frame(width: 200, height: 50, alignment: .center)
                            .foregroundColor(.black)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(radius: 3)
                    }
                    
                    Button(action: {
                        viewModel = viewModel.resetTest()
                        showCircle = false
                    }, label: {
                        Text("Reset test")
                            .bold()
                            .frame(width: 200, height: 50, alignment: .center)
                            .foregroundColor(.black)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(radius: 3)
                            .disabled(!viewModel.allSelectionsMade)
                    })
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
//        TheTest(viewModel: ViewModel())
        MainView()
    }
}
