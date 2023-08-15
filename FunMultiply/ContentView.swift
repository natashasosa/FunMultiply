//
//  ContentView.swift
//  FunMultiply
//
//  Created by Natasha Rebelo on 11/08/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .purple
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
    }
    
    
    @State private var tableRange = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    @State private var table = 2
    @State private var questionRange = [5, 10, 20]
    @State private var numberOfQuestions = 5
 
    var body: some View {
        NavigationView {
            ZStack {
            
                VStack(spacing: 30) {
                    Text("Fun Multiply")
                        .font(.largeTitle.weight(.black))
                        .foregroundColor(Color(red: 0.98, green: 0.67, blue: 0.09))
                    
                    VStack(spacing: 15) {
                        Spacer()
                        
                        Section {
                            Text("What table do you want to practice?")
                                .font(.title3.weight(.semibold))
                                .foregroundColor(.white)
                            
                            Picker("", selection: $table) {
                                ForEach(tableRange, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Spacer()
                        
                        Section {
                            Text("How many questions do you want to answer?")
                                .font(.title3.weight(.bold))
                                .foregroundColor(.white)
                            
                            Picker("", selection: $numberOfQuestions) {
                                ForEach(questionRange, id: \.self) {
                                    Text("\($0) questions")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Spacer()
                    }
                    .frame(width: .infinity, height: 300)
                    .padding(.vertical, 60)
                    .padding(.horizontal, 10)
                    .background(RadialGradient(stops: [
                        .init(color: Color(red: 0.98, green: 0.67, blue: 0.09), location: 0.0),
                        .init(color: Color(red: 0.75, green: 0.09, blue: 0.98), location: 0.6)
                    ], center: .top, startRadius: 100, endRadius: 700))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    Spacer()
                    
                    NavigationLink("Start", destination: GameView(table: table,numberOfQuestions: numberOfQuestions))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 35)
                        .background(Color(red: 0.98, green: 0.67, blue: 0.09))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.white)
                        .font(.title3 .weight(.bold))
                    
                    Spacer()
                        
                }
                .padding()
            }
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
