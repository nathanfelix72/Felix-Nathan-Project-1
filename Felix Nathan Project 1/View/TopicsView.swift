//
//  TopicsView.swift
//  Ogniloud
//
//  Created by IS 543 on 10/9/25.
import SwiftUI

// Topics list where each topic can expand to show subitems (lessons).
struct TopicsView: View {
    // Simple local model: each topic has a list of lesson titles
    struct TopicItem: Identifiable {
        let id = UUID()
        let title: String
        let lessons: [String]
    }

    // Replace these with your real lesson titles per topic
    private let topicsData: [TopicItem] = [
        TopicItem(title: "Relatives", lessons: ["Immediate Family", "Extended Family", "Terms"]),
        TopicItem(title: "Calendar", lessons: ["Days & Months", "Seasons", "Holidays"]),
        TopicItem(title: "Food", lessons: ["Fruits", "Meals", "Ordering Food"])        
    ]

    // Track which topics are expanded
    @State private var expandedTopics: Set<UUID> = []

    var body: some View {
        NavigationStack {
            List {
                ForEach(topicsData) { topic in
                    // Each row is a DisclosureGroup that can be expanded to show lessons
                    DisclosureGroup(isExpanded: Binding(get: {
                        expandedTopics.contains(topic.id)
                    }, set: { newValue in
                        if newValue { expandedTopics.insert(topic.id) } else { expandedTopics.remove(topic.id) }
                    })) {
                        // Subitems are NavigationLinks to IndividualTopicView
                        ForEach(topic.lessons, id: \.self) { lesson in
                            NavigationLink(destination: IndividualTopicView(topic: lesson)) {
                                Text(lesson)
                            }
                        }
                    } label: {
                        HStack {
                            Text(topic.title)
                                .font(.headline)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Topics")
        }
    }
}

#Preview {
    TopicsView()
}
