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
    
    private var model = OgniloudModel(topics: spanishTopics, flashcards: [], quizQuestions: [])
    
    // Mark - Initialization
    
    
    // Mark - Model Access
    
    var topics: [OgniloudModel.OgniloudTopic] {
        model.topics
    }
    
    var flashcards: [OgniloudModel.Flashcard] {
        model.flashcards
    }
    
    var quizQuestions: [OgniloudModel.QuizQuestion] {
        model.quizQuestions
    }
    
    // Mark - User Intents
    
    func getFlashcards(for topicTitle: String) -> [OgniloudModel.Flashcard] {
        let topic = model.topics.first(where: { $0.title == topicTitle })
        return topic?.flashcards ?? []
    }
    
    func getQuizQuestions(for topicTitle: String) -> [OgniloudModel.QuizQuestion] {
        let topic = model.topics.first(where: { $0.title == topicTitle })
        return topic?.quizQuestions ?? []
    }
    
    func initializeFlashcards(for topicTitle: String, count: Int) {
        model.initializeFlashcards(for: topicTitle, count: count)
    }
    
    func initializeQuizQuestions(for topicTitle: String, count: Int) {
        model.initializeQuizQuestions(for: topicTitle)
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
