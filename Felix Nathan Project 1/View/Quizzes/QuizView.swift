//
//  QuizView.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct QuizView: View {
    
    let viewModel: OgniloudViewModel
    
    let topic: String
    let quizQuestions: [String: String]
    
    @State private var currentIndex = 0
    
    private var entries: [(term: String, definition: String)] {
        quizQuestions.map { (term: $0.key, definition: $0.value) }
    }

    var body: some View {
        VStack() {
            let quizQuestions = viewModel.getQuizQuestions(for: topic)
            
            if currentIndex < quizQuestions.count {
                QuizQuestion(
                    quizQuestion: quizQuestions[currentIndex]
                )
                .frame(width: 250, height: 350)
                .animation(.easeInOut, value: currentIndex)
                .onTapGesture {
//                    viewModel.flipCard(quizQuestions[currentIndex], in: topic)
                }
            }
            
            HStack {
                Button("Previous") {
                    currentIndex = (currentIndex - 1 + entries.count) % entries.count
                }
                .disabled(currentIndex == 0)

                Spacer()

                Button("Next") {
                    currentIndex = (currentIndex + 1) % entries.count
                }
                .disabled(currentIndex == entries.count - 1)
            }
            .padding()
        }
        .padding()
        .onAppear {
            viewModel.initializeQuizQuestions(for: topic, count: entries.count)
        }
    }
}


#Preview {
    QuizView(viewModel: OgniloudViewModel(), topic: "Sample Topic", quizQuestions: [
        "Madre": "Mother",
        "Padre": "Father",
        "Hermano": "Brother",
        "Hermana": "Sister",
    ])
}
