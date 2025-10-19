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
        }
    }
    
    struct OgniloudTopic: Identifiable {
        var id: UUID = UUID()
        var title: String
        var terms: [String: String]
        var lesson: String
        var subPages: [String]
        var flashcards: [Flashcard] = []
    }
    
    struct Flashcard: Identifiable {
        fileprivate(set) var isFaceUp = false
        fileprivate(set) var id = UUID()
        fileprivate(set) var hasReviewed = false
    }
}
