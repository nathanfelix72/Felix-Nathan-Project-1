//
//  QuizView.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: - Properties
    
    var viewModel: OgniloudViewModel
    
    let topic: String
    let quizQuestions: [String: String]
    
    @State private var currentIndex = 0
    @State private var userAnswer = ""
    @State private var hasSubmitted = false
    @State private var entries: [OgniloudModel.QuizQuestion] = []
    @State private var quizCompleted = false
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            if !entries.isEmpty && entries.indices.contains(currentIndex) {
                if currentIndex < (entries.count) {
                    QuizQuestion(
                        quizQuestion: entries[currentIndex],
                        userAnswer: $userAnswer,
                        hasSubmitted: $hasSubmitted,
                        onSubmit: submitAnswer
                    )
                    .id(entries[currentIndex].id)
                }
                
                HStack {
                    Button(action: {
                        if currentIndex < (entries.count - 1) {
                            currentIndex += 1
                            loadCurrentQuestion()
                        } else {
                            quizCompleted = true
                            currentIndex += 1
                        }
                    }) {
                        HStack {
                            Text("Next")
                            Image(systemName: "chevron.right")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, Constants.buttonPadding)
                        .background(!hasSubmitted ? Color.gray.opacity(0.3) : Color.blue)
                        .foregroundColor(!hasSubmitted ? .gray : .white)
                        .cornerRadius(Constants.cornerRadius)
                    }
                    .disabled(currentIndex >= (entries.count) || !hasSubmitted)
                }
                .padding()
                
                Text("Question \(currentIndex + 1)/\(entries.count)")
            } else {
                let currentScore = entries.filter { $0.answeredCorrectly }.count
                
                List {
                    Section(header: Text("Quiz Complete!")) {
                        Text("You have completed the quiz on \(topic).")
                        
                        Text("Score: \(currentScore)/\(entries.count) - High Score: \(viewModel.getHighScore(for: topic))")
                            .font(.headline)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        
                        ForEach(entries) { entry in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(entry.question)
                                    .font(.subheadline)
                                
                                if let userAns = entry.userAnswer {
                                    if entry.answeredCorrectly {
                                        HStack {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundColor(.green)
                                            Text("Your Answer: \(userAns)")
                                                .foregroundColor(.green)
                                        }
                                    } else {
                                        HStack {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(.red)
                                            VStack(alignment: .leading) {
                                                Text("Your Answer: \(userAns)")
                                                    .foregroundColor(.red)
                                                Text("Correct Answer: \(entry.correctAnswer)")
                                                    .foregroundColor(.blue)
                                            }
                                        }
                                    }
                                } else {
                                    Text("No Answer Submitted")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    
                    Button("Retake Quiz") {
                        resetQuiz()
                    }
                }
                .onAppear {
                    if quizCompleted {
                        let score = entries.filter { $0.answeredCorrectly }.count
                        viewModel.updateHighScore(for: topic, score: score)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            entries = viewModel.getQuizQuestions(for: topic)
            currentIndex = 0
            quizCompleted = false
            loadCurrentQuestion()
        }
        .onDisappear {
            if !quizCompleted && currentIndex < entries.count {
                viewModel.resetProgress(for: topic, component: "Quiz")
            }
        }
    }
    
    // MARK: - Helpers
    
    private func resetQuiz() {
        viewModel.resetProgress(for: topic, component: "Quiz")
        entries = viewModel.getQuizQuestions(for: topic)
        currentIndex = 0
        quizCompleted = false
        loadCurrentQuestion()
    }
    
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
        
        entries = viewModel.getQuizQuestions(for: topic)
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let buttonPadding = 12.0
        static let cornerRadius = 10.0
    }
}


#Preview {
    QuizView(viewModel: OgniloudViewModel(), topic: "Relationships", quizQuestions: [:])
}
