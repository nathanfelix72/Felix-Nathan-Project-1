//
//  FlashcardView.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct FlashcardView: View {
    
    // MARK: - Properties
    
    let viewModel: OgniloudViewModel
    let topic: String
    let terms: [String: String]
    
    @State private var currentIndex = 0
    
    // MARK: - Computed Properties
    
    private var entries: [(term: String, definition: String)] {
        terms.map { (term: $0.key, definition: $0.value) }
    }

    // MARK: - Body
    
    var body: some View {
        VStack() {
            let flashcards = viewModel.getFlashcards(for: topic)
            
            if currentIndex < flashcards.count {
                Flashcard(
                    flashcard: flashcards[currentIndex],
                    terms: [flashcards[currentIndex].term, flashcards[currentIndex].definition]
                )
                .frame(width: 250, height: 350)
                .animation(.easeInOut, value: currentIndex)
                .onTapGesture {
                    viewModel.flipCard(flashcards[currentIndex], in: topic)
                }
            }
            
            Text("Flashcard \(currentIndex + 1)/\(flashcards.count)")
            
            Text("Number Reviewed: \(flashcards.filter { $0.isReviewed }.count)")
            
            HStack {
                Button("Previous") {
                    currentIndex = (currentIndex - 1 + flashcards.count) % flashcards.count
                }
                .disabled(currentIndex == 0)

                Spacer()

                Button("Next") {
                    currentIndex = (currentIndex + 1) % flashcards.count
                }
                .disabled(currentIndex == flashcards.count - 1)
            }
            .padding()
            
            Button("Mark all as reviewed") {
                viewModel.markAllFlashcards(for: topic, reviewed: true)
            }
            Button("Mark all as unreviewed") {
                viewModel.markAllFlashcards(for: topic, reviewed: false)
            }
            Button("Shuffle Flashcards") {
                viewModel.shuffleFlashcards(for: topic)
                currentIndex = 0
            }
        }
        .padding()
        .onAppear {
            viewModel.shuffleFlashcards(for: topic)
        }
    }
}


#Preview {
    FlashcardView(viewModel: OgniloudViewModel(), topic: "Relationships", terms: [
        "Madre": "Mother",
        "Padre": "Father",
        "Hermano": "Brother",
        "Hermana": "Sister",
    ])
}
