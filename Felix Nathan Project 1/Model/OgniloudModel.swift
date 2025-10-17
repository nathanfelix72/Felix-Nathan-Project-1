//
//  OgniloudModel.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import Foundation

struct OgniloudModel {
    var topics: [OgniloudTopic]
    
    struct OgniloudTopic: Identifiable {
        var id: UUID = UUID()
        var title: String
        var terms: [String: String]
        var lesson: String
        var subPages: [String]
    }
}
