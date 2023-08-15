//
//  ContentView.swift
//  FunMultiply
//
//  Created by Natasha Rebelo on 11/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tableRange = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    @State private var table = 2
    @State private var questionRange = [5, 10, 20]
    @State private var numberOfQuestions = 5
 
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    Text("What table do you want to practice?")
                        .font(.headline)
                    Picker("", selection: $table) {
                        ForEach(tableRange, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text("How many questions do you want to answer?")
                        .font(.headline)
                    Picker("", selection: $numberOfQuestions) {
                        ForEach(questionRange, id: \.self) {
                            Text("\($0) questions")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                NavigationLink("Start", destination: GameView(table: table,numberOfQuestions: numberOfQuestions))
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
