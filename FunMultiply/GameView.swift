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
    
    @State private var score = 0
    @State private var multiplier = 1
 
    @State private var correctAnswer = 0
    @State private var userAnswer = 0
    
    @State private var isGameOver = false
    
    @Environment(\.dismiss) private var dismiss
    
    
    @State private var currentQuestionIndex = 0
    
    var body: some View {
        VStack {
            Text("You will answer \(numberOfQuestions) questions on the table of \(table)")
            Form {
                Section {
                    Text("How much is \(table) x \(multiplier)?")
                } header: {
                    Text("Question \(currentQuestionIndex + 1) of \(numberOfQuestions): ")
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
                        
                        dismissButton: .default(Text("Start over")) {
                            dismiss()
                        }
                    )
                }
                .navigationTitle("Fun multiply")
            }
        }        
        .onAppear {
            playRound()
        }
    }
        
    private func checkAnswer() {
        if userAnswer == correctAnswer {
            score += 1
        }
        
        if currentQuestionIndex < numberOfQuestions - 1 {
            currentQuestionIndex += 1
            playRound()
        } else {
            gameOver()
        }
    }
    
    func playRound() {
        multiplier = Int.random(in: 1...10)
        correctAnswer = table * multiplier
    }
    
    func gameOver() {
        isGameOver = true
    }
}








struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(table: 2, numberOfQuestions: 10/*, selectedLevel: "Easy"*/)
    }
}
