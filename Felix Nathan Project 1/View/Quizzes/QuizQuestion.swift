//
//  QuizQuestion.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/18/25.
//

import SwiftUI

struct QuizQuestion: View {
    let quizQuestion: OgniloudModel.QuizQuestion
    
    var body: some View {
        VStack {
            Color.clear
        }
        .quizzify(question: quizQuestion.question, correctAnswer: quizQuestion.correctAnswer, answeredCorrectly: false)
        .aspectRatio(3.0 / 4.0, contentMode: .fit)
    }
}

#Preview {
    QuizQuestion(quizQuestion: OgniloudModel.QuizQuestion(question: "Madre", correctAnswer: "Mother", answeredCorrectly: false))
        .padding()
}

