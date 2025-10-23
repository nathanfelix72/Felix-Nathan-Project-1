//
//  QuizQuestion.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/18/25.
//

import SwiftUI

struct QuizQuestion: View {
    
    // MARK: - Properties
    
    let quizQuestion: OgniloudModel.QuizQuestion
    
    @Binding var userAnswer: String
    @Binding var hasSubmitted: Bool
    
    let onSubmit: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Color.clear
        }
        .quizzify(
            question: quizQuestion.question,
            correctAnswer: quizQuestion.correctAnswer,
            answeredCorrectly: quizQuestion.answeredCorrectly,
            userAnswer: $userAnswer,
            hasSubmitted: $hasSubmitted,
            onSubmit: onSubmit
        )
        .aspectRatio(Constants.aspectRatio, contentMode: .fit)
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let aspectRatio: CGFloat = 3.0 / 4.0
    }
}

#Preview {
    QuizQuestion(
        quizQuestion: OgniloudModel.QuizQuestion(question: "What is 'Madre' in English?", correctAnswer: "Mother", answeredCorrectly: false),
        userAnswer: .constant(""),
        hasSubmitted: .constant(false),
        onSubmit: {}
    )
        .padding()
}
