//
//  HomeView.swift
//  Ogniloud
//
//  Created by IS 543 on 10/9/25.
//

import SwiftUI

struct HomeView: View {
    let topics = ["Relatives", "Calendar", "Food"]
    
    var body: some View {
        NavigationStack {
            List(topics, id: \.self) { topic in
                NavigationLink(destination: TopicView(topic: topic)) {
                    Text(topic)
                }
            }
            .navigationTitle("Topics")
            
        }
    }
}

struct TopicView: View {
    let topic: String
    
    var body: some View {
        Form {
            Section(header: Text("Lesson about \(topic)")) {
                Button(action: {
                    // NEEDSWORK
                }, label: {
                    Text("Mark Complete")
                })
            }
        }
        .navigationTitle(topic)
    }
}

#Preview {
    HomeView()
}
