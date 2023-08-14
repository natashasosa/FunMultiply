//
//  ContentView.swift
//  FunMultiply
//
//  Created by Natasha Rebelo on 11/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var table = 2
    @State private var questionRange = [5, 10, 20]
    @State private var numberOfQuestions = 5
    //@State private var levels = ["Easy", "Medium", "Hard"]
    //@State private var selectedLevel = "Easy"
    @State private var multipliers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    //@State private var showingGame = false
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    Text("What table do you want to practice?")
                        .font(.headline)
                    Stepper("\(table)", value: $table, in: 2...12)
                }
                
                Section {
                    Text("How many questions do you want to answer?")
                        .font(.headline)
                    Picker("I want:", selection: $numberOfQuestions) {
                        ForEach(questionRange, id: \.self) {
                            Text("\($0) questions")
                        }
                        
                    }
                }
                
                /*Section {
                    Text("Choose a level o difficulty")
                        .font(.headline)
                    Picker("Level: ", selection: $selectedLevel) {
                        ForEach(levels, id: \.self) {
                            Text($0)
                        }
                        
                    }
                }*/
                
                
                NavigationLink("Start", destination: GameView(
                                    table: table,
                                    numberOfQuestions: numberOfQuestions//,
                                    //selectedLevel: selectedLevel
                                ))
            }
            .navigationTitle("Fun multiply")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
