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
    @State private var currentQuestionIndex = 0
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Image("funmultiply-background-3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Ready, set, go!!")
                    .padding(.horizontal, 50)
                    .font(.title.weight(.black))
                    .foregroundColor(Color(red: 0.98, green: 0.67, blue: 0.09))
                
                VStack(spacing: 15) {
                    Section {
                        Text("Question \(currentQuestionIndex + 1) of \(numberOfQuestions): ")
                            .font(.title3)
                            .foregroundColor(.white)
                        Text("How much is \(table) x \(multiplier)?")
                            .font(.title.weight(.bold))
                            .foregroundColor(.white)
                    }
                    
                    Section {
                        TextField("Your Answer", value: $userAnswer, format: .number)
                            .padding()
                            .font(.system(size: 16))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    
                    Button("Submit Answer") {
                        checkAnswer()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color(red: 0.5, green: 0.0, blue: 0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.white)
                    .font(.title3 .weight(.bold))
                    .shadow(radius: 1)
                    
                    .alert(isPresented: $isGameOver) {
                        Alert(
                            title: Text("Game Over"),
                            message: Text("Your final score is \(score)"),
                            dismissButton: .default(Text("Start over")) {
                                dismiss()
                            }
                        )
                    }
                }
                .frame(width: .infinity, height: 300)
                .padding(.vertical, 60)
                .padding(.horizontal, 10)
                .background(RadialGradient(stops: [
                    .init(color: Color(red: 0.98, green: 0.67, blue: 0.09), location: 0.0),
                    .init(color: Color(red: 0.75, green: 0.09, blue: 0.98), location: 0.8)
                ], center: .top, startRadius: 100, endRadius: 700))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 3)
                
                Spacer()
                
                Section {
                    Text("Your score: \(score)")
                        .font(.title2.weight(.bold))
                        .foregroundColor(Color(red: 0.98, green: 0.67, blue: 0.09))
                }
                
                Spacer()
            }
            .padding()
            .onAppear {
                playRound()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(5)
                    .background(Color(red: 0.5, green: 0.0, blue: 0.5))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                }
        })
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
        GameView(table: 2, numberOfQuestions: 10)
    }
}
