//
//  Quizzify.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/18/25.
//

import SwiftUI

struct Quizzify: ViewModifier {
    var question: String
    var correctAnswer: String
    var answeredCorrectly: Bool
    @Binding var userAnswer: String
    @Binding var hasSubmitted: Bool
    let onSubmit: () -> Void
    
    private var isCorrect: Bool {
        userAnswer.lowercased().trimmingCharacters(in: .whitespaces) ==
        correctAnswer.lowercased().trimmingCharacters(in: .whitespaces)
    }

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 16) {
                    Text(question)
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    Spacer()
                    
                    if !hasSubmitted {
                        VStack(spacing: 12) {
                            TextField("Your answer", text: $userAnswer)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            
                            Button(action: onSubmit) {
                                Text("Submit")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(userAnswer.isEmpty ? Color.gray : Color.blue)
                                    .cornerRadius(10)
                            }
                            .disabled(userAnswer.isEmpty)
                            .padding(.horizontal)
                        }
                    } else {
                        VStack(spacing: 12) {
                            HStack(spacing: 8) {
                                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                    .foregroundColor(isCorrect ? .green : .red)
                                    .font(.title)
                                Text(isCorrect ? "Correct!" : "Incorrect")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(isCorrect ? .green : .red)
                            }
                            
                            VStack(spacing: 4) {
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
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
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
