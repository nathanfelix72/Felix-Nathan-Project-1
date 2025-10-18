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
    
    mutating func flipCard(flashcard: Flashcard) {
        if let index = flashcards.firstIndex(where: { $0.id == flashcard.id }) {
            flashcards[index].isFaceUp.toggle()
        }
    }
    
    struct OgniloudTopic: Identifiable {
        var id: UUID = UUID()
        var title: String
        var terms: [String: String]
        var lesson: String
        var subPages: [String]
    }
    
    struct Flashcard: Identifiable {
        fileprivate(set) var isFaceUp = false
        fileprivate(set) var id = UUID()
    }
}
