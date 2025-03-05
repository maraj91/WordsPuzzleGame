//
//  ContentView.swift
//  WordsPuzzleGame
//
//  Created by Maraj Hussain on 03/03/25.
//

import SwiftUI

struct GameView: View {
    
    @State private var guessedLetters: [LetterModel] = []
    @State private var showSuccess = false
    @State private var showFailure = false
    @State private var score = 0
    @State var questions: [QuestionModel] = QuestionModel.generateQuestion()
    
    @State private var currentQuestionIndex = 0
    @State private var showFianlScore = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    VStack {
                        Spacer()
                        Image(questions[currentQuestionIndex].image)
                            .resizable()
                            .frame(width:100,height:100)
                        Spacer()
                        HStack {
                            ForEach(guessedLetters) { letter in
                                VStack {
                                    LetterView(letter: letter)
                                        .onTapGesture {
                                            if let index = guessedLetters.firstIndex(of: letter) {
                                                
                                                questions[currentQuestionIndex].scrambleLetters[letter.id].letter = letter.letter
                                                guessedLetters.remove(at: index)
                                            }
                                        }
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 25, height: 2)
                                }
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.width * 0.9)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.border, lineWidth: 2)
                    }
                    
                    Text("Score: \(score)")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top)
                    
                    HStack {
                        ForEach(Array(questions[currentQuestionIndex].scrambleLetters.enumerated()), id: \.1) { index, letter in
                            LetterView(letter: letter)
                                .onTapGesture {
                                    if !letter.letter.isEmpty {
                                        guessedLetters.append(letter)
                                        questions[currentQuestionIndex].scrambleLetters[index].letter = ""
                                        if(guessedLetters.count == questions[currentQuestionIndex].scrambleLetters.count) {
                                            // Evalute the anwer correct & wrong
                                            var guessAnswer = guessedLetters.map{ $0.letter}.joined()
                                            if guessAnswer == questions[currentQuestionIndex].answer {
                                                showSuccess = true
                                                score += 1
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                                    showSuccess = false
                                                    if currentQuestionIndex < questions.count-1 {
                                                        currentQuestionIndex += 1
                                                    } else {
                                                        showFianlScore = true
                                                    }
                                                })
                                            } else {
                                                showFailure = true
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                                    showFailure = false
                                                    if currentQuestionIndex < questions.count-1 {
                                                        currentQuestionIndex += 1
                                                    } else {
                                                        showFianlScore = true
                                                    }
                                                })
                                            }
                                            guessedLetters.removeAll()
                                        }
                                    }
                                }
                        }
                        
                    }
                }
                if showFailure {
                    VStack {
                        Image("cross")
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.5))
                }
                if showSuccess {
                    VStack {
                        Image("tick")
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.5))
                }
            }
        }
        .sheet(isPresented: $showFianlScore) {
            questions = QuestionModel.generateQuestion()
            currentQuestionIndex = 0
            score = 0
        } content: {
            ScoreView(score: score, questionCount: questions.count)
        }

    }
    
}

#Preview {
    GameView()
}
