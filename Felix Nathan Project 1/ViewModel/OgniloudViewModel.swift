//
//  OgniloudViewModel.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

@Observable
class OgniloudViewModel {
    // MARK - Constants
    
    
    // Mark - Properties
    
    private var model = OgniloudModel(topics: spanishTopics, flashcards: [])
    
    // Mark - Initialization
    
    
    // Mark - Model Access
    
    var topics: [OgniloudModel.OgniloudTopic] {
        model.topics
    }
    
    var flashcards: [OgniloudModel.Flashcard] {
        model.flashcards
    }
    
    // Mark - User Intents
    
    func getFlashcards(for topicTitle: String) -> [OgniloudModel.Flashcard] {
        let topic = model.topics.first(where: { $0.title == topicTitle })
        return topic?.flashcards ?? []
    }

    
    func initializeFlashcards(for topicTitle: String, count: Int) {
        if let index = model.topics.firstIndex(where: { $0.title == topicTitle }) {
            if model.topics[index].flashcards.isEmpty {
                model.topics[index].flashcards = (0..<count).map { _ in
                    OgniloudModel.Flashcard(isFaceUp: true)
                }
            }
        }
    }

    func flipCard(_ flashcard: OgniloudModel.Flashcard, in topicTitle: String) {
        withAnimation(.easeIn(duration: 0.5)) {
            model.flipCard(flashcard, in: topicTitle)
        }
    }
    
    // Mark - Private Helpers
    
    
}
