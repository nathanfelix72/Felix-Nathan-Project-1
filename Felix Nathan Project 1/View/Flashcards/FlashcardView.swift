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
                    terms: [entries[currentIndex].term, entries[currentIndex].definition]
                )
                .frame(width: 250, height: 350)
                .animation(.easeInOut, value: currentIndex)
                .onTapGesture {
                    viewModel.flipCard(flashcards[currentIndex], in: topic)
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
            viewModel.initializeFlashcards(for: topic, count: entries.count)
            viewModel.shuffleFlashcards(for: topic)
        }
    }
}


#Preview {
    FlashcardView(viewModel: OgniloudViewModel(), topic: "Sample Topic", terms: [
        "Madre": "Mother",
        "Padre": "Father",
        "Hermano": "Brother",
        "Hermana": "Sister",
    ])
}
