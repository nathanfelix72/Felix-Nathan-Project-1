//
//  OgniloudViewModel.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

@Observable class OgniloudViewModel {
    // MARK - Constants
    
    
    // Mark - Properties
    
    private var model = OgniloudModel(topics: spanishTopics, flashcards: [])
    
    // Mark - Initialization
    
    
    // Mark - Model Access
    
    var topics: [OgniloudModel.OgniloudTopic] {
        model.topics
    }
    
    // Mark - User Intents
    
    func flipCard(_ flashcard: OgniloudModel.Flashcard) {
        withAnimation(.easeIn(duration: 0.5)) {
            model.flipCard(flashcard: flashcard)
        }
    }
    
    // Mark - Private Helpers
    
    
}
