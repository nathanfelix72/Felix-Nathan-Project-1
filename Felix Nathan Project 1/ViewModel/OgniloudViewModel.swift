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
        model.initializeFlashcards(for: topicTitle, count: count)
    }

    func flipCard(_ flashcard: OgniloudModel.Flashcard, in topicTitle: String) {
        withAnimation(.easeIn(duration: 0.5)) {
            model.flipCard(flashcard, in: topicTitle)
        }
    }
    
    func markLessonComplete(for topicTitle: String) {
        model.markLessonComplete(for: topicTitle)
    }
    
    func getProgress(for topicTitle: String) -> [String: String] {
        return model.topics.first(where: { $0.title == topicTitle })?.progress ?? [:]
    }
    
    // Mark - Private Helpers
    
    
}
