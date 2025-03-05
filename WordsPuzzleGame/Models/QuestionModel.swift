//
//  QuestionModel.swift
//  WordsPuzzleGame
//
//  Created by Maraj Hussain on 05/03/25.
//

import Foundation
struct QuestionModel{
    var scrambleLetters:[LetterModel]
    let answer: String
    let image: String
}

// Generate questions
extension QuestionModel {
    static func generateQuestion() -> [QuestionModel] {
        return [
            QuestionModel(scrambleLetters: [
                LetterModel(id: 0, letter: "A"),
                LetterModel(id: 1, letter: "R"),
                LetterModel(id: 2, letter: "O"),
                LetterModel(id: 3, letter: "E"),
                LetterModel(id: 4, letter: "N"),
                LetterModel(id: 5, letter: "G"),
            ], answer: "ORANGE", image: "orange"),
            
            QuestionModel(scrambleLetters: [
                LetterModel(id: 0, letter: "A"),
                LetterModel(id: 1, letter: "A"),
                LetterModel(id: 2, letter: "N"),
                LetterModel(id: 3, letter: "N"),
                LetterModel(id: 4, letter: "B"),
                LetterModel(id: 5, letter: "A"),
            ], answer: "BANANA", image: "banana"),
            
            QuestionModel(scrambleLetters: [
                LetterModel(id: 0, letter: "A"),
                LetterModel(id: 1, letter: "E"),
                LetterModel(id: 2, letter: "L"),
                LetterModel(id: 3, letter: "P"),
                LetterModel(id: 4, letter: "P")
            ], answer: "APPLE", image: "apple")
        ]
    }
}
