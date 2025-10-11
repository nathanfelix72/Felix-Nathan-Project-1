//
//  TopicsView.swift
//  Ogniloud
//
//  Created by IS 543 on 10/9/25.
//

import SwiftUI

struct TopicsView: View {
    struct TopicItem: Identifiable {
        let id = UUID()
        let title: String
        let pages: [String]
    }

    private let topicsData: [TopicItem] = [
        TopicItem(title: "Greetings", pages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]),
        TopicItem(title: "Relatives", pages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]),
        TopicItem(title: "Calendar", pages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"]),
        TopicItem(title: "Food", pages: ["View Vocabulary List", "Practice Flashcards", "Lesson", "Quiz", "View Progress"])
    ]

    @State private var expandedTopics: Set<UUID> = []

    var body: some View {
        NavigationStack {
            List {
                ForEach(topicsData) { topic in
                    DisclosureGroup(isExpanded: Binding(get: {
                        expandedTopics.contains(topic.id)
                    }, set: { newValue in
                        if newValue { expandedTopics.insert(topic.id) } else { expandedTopics.remove(topic.id) }
                    })) {
                        ForEach(topic.pages, id: \.self) { page in
                            NavigationLink(destination: ProgressView(topic: page)) {
                                Text(page)
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
