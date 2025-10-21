//
//  QuizView.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: - Properties
    
    @Bindable var viewModel: OgniloudViewModel
    
    let topic: String
    let quizQuestions: [String: String]
    
    @State private var currentIndex = 0
    @State private var userAnswer = ""
    @State private var hasSubmitted = false
    @State private var entries: [OgniloudModel.QuizQuestion] = []
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            if !entries.isEmpty && entries.indices.contains(currentIndex) {
                QuizQuestion(
                    quizQuestion: entries[currentIndex],
                    userAnswer: $userAnswer,
                    hasSubmitted: $hasSubmitted,
                    onSubmit: submitAnswer
                )
                .id(entries[currentIndex].id)
                
                HStack {
                    Button("Previous") {
                        currentIndex -= 1
                        loadCurrentQuestion()
                    }
                    .disabled(currentIndex == 0)
                    
                    Spacer()
                    
                    Button("Next") {
                        currentIndex += 1
                        loadCurrentQuestion()
                    }
                    .disabled(currentIndex >= (entries.count - 1))
                }
                .padding()
            } else {
                Text("Loading quiz...")
                    .padding()
            }
        }
        .padding()
        .onAppear {
            viewModel.initializeQuizQuestions(for: topic, count: quizQuestions.count)
            
            entries = viewModel.getQuizQuestions(for: topic)
            currentIndex = 0
            
            loadCurrentQuestion()
        }
    }
    
    // MARK: - Helpers
    
    private func loadCurrentQuestion() {
        guard entries.indices.contains(currentIndex) else {
            userAnswer = ""
            hasSubmitted = false
            return
        }
        let current = entries[currentIndex]
        userAnswer = current.userAnswer ?? ""
        hasSubmitted = current.userAnswer != nil
    }
    
    private func submitAnswer() {
        let isCorrect = userAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == entries[currentIndex].correctAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        viewModel.submitQuizAnswer(
            for: topic,
            questionId: entries[currentIndex].id,
            userAnswer: userAnswer,
            isCorrect: isCorrect
        )
        
        hasSubmitted = true
    }
}


#Preview {
    QuizView(viewModel: OgniloudViewModel(), topic: "Sample Topic", quizQuestions: [
        "What is 'Madre' in English?": "Mother",
        "What is 'Padre' in English?": "Father",
        "What is 'Hermano' in English?": "Brother",
        "What is 'Hermana' in English?": "Sister",
    ])
}
