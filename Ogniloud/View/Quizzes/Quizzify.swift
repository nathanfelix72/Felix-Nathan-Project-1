//
//  Quizzify.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/18/25.
//

import SwiftUI

struct Quizzify: ViewModifier {
    
    // MARK: - Constants
    
    private struct Constants {
        static let cornerRadius = 10.0
        static let iconSpacing = 8.0
        static let spacing = 12.0
        static let verticalSpacing = 16.0
        static let buttonPadding = 12.0
        static let answerSpacing = 4.0
    }
    
    // MARK: - Properties
    
    var question: String
    var correctAnswer: String
    var answeredCorrectly: Bool
    
    @Binding var userAnswer: String
    @Binding var hasSubmitted: Bool
    
    let onSubmit: () -> Void
    
    // MARK: - Computed Properties
    
    private var isCorrect: Bool {
        userAnswer.lowercased().trimmingCharacters(in: .whitespaces) ==
        correctAnswer.lowercased().trimmingCharacters(in: .whitespaces)
    }

    // MARK: - Body
    
    func body(content: Content) -> some View {
        VStack(spacing: Constants.verticalSpacing) {
            Spacer()
            
            Text(question)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            if !hasSubmitted {
                VStack(spacing: Constants.spacing) {
                    TextField("Your answer", text: $userAnswer)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: onSubmit) {
                        Text("Submit")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, Constants.buttonPadding)
                            .background(userAnswer.isEmpty ? Color.gray : Color.blue)
                            .cornerRadius(Constants.cornerRadius)
                    }
                    .disabled(userAnswer.isEmpty)
                }
                .padding(.horizontal)
            } else {
                VStack(spacing: Constants.spacing) {
                    HStack(spacing: Constants.iconSpacing) {
                        Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(isCorrect ? .green : .red)
                            .font(.title)
                        Text(isCorrect ? "Correct!" : "Incorrect")
                            .font(.title3)
                            .bold()
                            .foregroundColor(isCorrect ? .green : .red)
                    }
                    
                    Text("Your answer: \(userAnswer)")
                        .foregroundColor(isCorrect ? .primary : .secondary)
                        .font(.subheadline)
                    
                    if !isCorrect {
                        Text("Correct answer: \(correctAnswer)")
                            .foregroundColor(.green)
                            .bold()
                            .font(.subheadline)
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding()
    }
}

extension View {
    func quizzify(
        question: String,
        correctAnswer: String,
        answeredCorrectly: Bool,
        userAnswer: Binding<String>,
        hasSubmitted: Binding<Bool>,
        onSubmit: @escaping () -> Void
    ) -> some View {
        modifier(Quizzify(
            question: question,
            correctAnswer: correctAnswer,
            answeredCorrectly: answeredCorrectly,
            userAnswer: userAnswer,
            hasSubmitted: hasSubmitted,
            onSubmit: onSubmit
        ))
    }
}
