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
    let viewModel: OgniloudViewModel
    let topic: String
    
    @Binding var userAnswer: String
    @Binding var hasSubmitted: Bool
    
    let onAnswerSubmitted: () -> Void
    
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
            onSubmit: {
                submitAnswer()
            }
        )
    }
    
    // MARK: - Private Functions
    
    private func submitAnswer() {
        let isCorrect = userAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == quizQuestion.correctAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        viewModel.submitQuizAnswer(
            for: topic,
            questionId: quizQuestion.id,
            userAnswer: userAnswer,
            isCorrect: isCorrect
        )
        
        hasSubmitted = true
        onAnswerSubmitted()
    }
}

#Preview {
    QuizQuestion(
        quizQuestion: OgniloudModel.QuizQuestion(question: "What is 'Madre' in English?", correctAnswer: "Mother", answeredCorrectly: false),
        viewModel: OgniloudViewModel(),
        topic: "Relationships",
        userAnswer: .constant(""),
        hasSubmitted: .constant(false),
        onAnswerSubmitted: {}
    )
        .padding()
}
