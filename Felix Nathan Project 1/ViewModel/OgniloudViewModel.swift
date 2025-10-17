//
//  OgniloudViewModel.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import Foundation

@Observable class OgniloudViewModel {
    // MARK - Constants
    
    
    // Mark - Properties
    
    private var model = OgniloudModel(topics: spanishTopics)
    
    // Mark - Initialization
    
    
    // Mark - Model Access
    
    var topics: [OgniloudModel.OgniloudTopic] {
        model.topics
    }
    
    // Mark - User Intents
    
    
    // Mark - Private Helpers
    
    
}
