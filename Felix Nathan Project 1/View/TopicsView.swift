//
//  TopicsView.swift
//  Ogniloud
//
//  Created by IS 543 on 10/9/25.
//

import SwiftUI

struct TopicsView: View {
    let topics = ["Relatives", "Calendar", "Food"]
    
    var body: some View {
        NavigationStack {
            List(topics, id: \.self) { topic in
                NavigationLink(destination: IndividualTopicView(topic: topic)) {
                    Text(topic)
                }
            }
            .navigationTitle("Topics")
            
        }
    }
}

#Preview {
    TopicsView()
}
