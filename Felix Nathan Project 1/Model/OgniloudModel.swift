//
//  OgniloudModel.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import Foundation

struct OgniloudModel {
    var topics: [OgniloudTopic]
    var flashcards: Array<Flashcard>
    
    mutating func flipCard(_ flashcard: Flashcard, in topicTitle: String) {
        if let topicIndex = topics.firstIndex(where: { $0.title == topicTitle }),
           let cardIndex = topics[topicIndex].flashcards.firstIndex(where: { $0.id == flashcard.id }) {
            topics[topicIndex].flashcards[cardIndex].isFaceUp.toggle()
            topics[topicIndex].flashcards[cardIndex].hasReviewed = true
            
            updateFlashcardProgress(for: topicIndex)
        }
    }
    
    mutating func initializeFlashcards(for topicTitle: String, count: Int) {
        if let index = topics.firstIndex(where: { $0.title == topicTitle }) {
            if topics[index].flashcards.isEmpty {
                topics[index].flashcards = (0..<count).map { _ in
                    Flashcard(isFaceUp: true)
                }
                topics[index].progress["Flashcards"] = "0/\(count) reviewed"
            }
        }
    }
    
    mutating func markLessonComplete(for topicTitle: String) {
        if let index = topics.firstIndex(where: { $0.title == topicTitle }) {
            topics[index].progress["Lesson"] = "Completed"
        }
    }
    
    private mutating func updateFlashcardProgress(for topicIndex: Int) {
        let reviewedCount = topics[topicIndex].flashcards.filter { $0.hasReviewed }.count
        let totalCount = topics[topicIndex].flashcards.count
        topics[topicIndex].progress["Flashcards"] = "\(reviewedCount)/\(totalCount) reviewed"
    }
    
    struct OgniloudTopic: Identifiable {
        var id: UUID = UUID()
        var title: String
        var terms: [String: String]
        var lessonContent: String
        var quizQuestions: [String: String]
        var progress: [String: String]
        var flashcards: [Flashcard] = []
        var subPages: [String]
    }
    
    struct Flashcard: Identifiable {
        fileprivate(set) var isFaceUp = false
        fileprivate(set) var id = UUID()
        fileprivate(set) var hasReviewed = false
    }
}
