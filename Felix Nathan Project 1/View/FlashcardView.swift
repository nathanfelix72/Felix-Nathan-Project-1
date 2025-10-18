//
//  FlashcardView.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct FlashcardView: View {
    let topic: String
    let terms: [String: String]
    
    @State private var currentIndex = 0
    
    private var entries: [(term: String, definition: String)] {
        terms.map { (term: $0.key, definition: $0.value) }
    }

    var body: some View {
        VStack() {
            Flashcard(
                flashcard: OgniloudModel.Flashcard(isFaceUp: true),
                terms: [entries[currentIndex].term, entries[currentIndex].definition]
            )
            .frame(width: 250, height: 350)
            .animation(.easeInOut, value: currentIndex)

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
    }
}


#Preview {
    FlashcardView(topic: "Sample Topic", terms: [
        "Madre": "Mother",
        "Padre": "Father",
        "Hermano": "Brother",
        "Hermana": "Sister",
    ])
}
