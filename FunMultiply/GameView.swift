//
//  GameView.swift
//  FunMultiply
//
//  Created by Natasha Rebelo on 14/08/23.
//

import SwiftUI

struct GameView: View {
    
    let table: Int
    let numberOfQuestions: Int
    let selectedLevel: String
    
    @State private var score = 0
    @State private var multiplier = 1
 
    @State private var correctAnswer = 0
    @State private var userAnswer = 0
    
    @State private var isGameOver = false
    
    
    @State private var currentQuestionIndex = 0
    
    var body: some View {
        Form {
            
            Section {
                Text("You will answer \(numberOfQuestions) \(selectedLevel.lowercased()) questions on the table of \(table)")
            }
            
            Section {
                Text("Question \(currentQuestionIndex + 1) of \(numberOfQuestions): ")
                Text("How much is \(table) x \(multiplier)?")
            }
            
            Section {
                TextField("Your Answer", value: $userAnswer, format: .number)
                
                Button("Submit Answer") {
                    checkAnswer()
                }
            }
                

            
            
            
            Section {
                Text("Your score: \(score)")
            }
            
            
            .alert(isPresented: $isGameOver) {
                Alert(
                    title: Text("Game Over"),
                    message: Text("Your final score is \(score)"),
                    primaryButton: .default(Text("Start over")) {
                        resetGame()
                    },
                    secondaryButton: .default(Text("Back")) {
                        NavigationLink("", destination: ContentView())
                    }
                    //dismissButton: .default(Text("OK")) {
                        // Reset the game and navigate back to ContentView
                        
                    //},
                
                )
                
            }
            
            .navigationTitle("Fun multiply")
        }
        

        .onAppear {
            playRound(table: table, selectedLevel: selectedLevel)
        }
    }
    
    
    private func checkAnswer() {
        if userAnswer == correctAnswer {
            score += 1
        }
        
        if currentQuestionIndex < numberOfQuestions - 1 {
            currentQuestionIndex += 1
            playRound(table: table, selectedLevel: selectedLevel)
        } else {
            gameOver()
        }
    }
    
    func playRound(table: Int, selectedLevel: String) {
        
        switch selectedLevel {
        case "Easy":
            multiplier = Int.random(in: 1...3)
            
        case "Medium":
            multiplier = Int.random(in: 4...6)
        
        case "Hard":
            multiplier = Int.random(in: 7...10)
        
        default:
            multiplier = 1
        }
        
        correctAnswer = table * multiplier
    }
    
    func gameOver() {
        isGameOver = true
    }
    
    func resetGame() {
        isGameOver = false
        score = 0
        currentQuestionIndex = 0
        playRound(table: table, selectedLevel: selectedLevel)
    
    }
}








struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(table: 2, numberOfQuestions: 10, selectedLevel: "Easy")
    }
}
