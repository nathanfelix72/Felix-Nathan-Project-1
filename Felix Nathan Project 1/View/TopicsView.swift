//
//  TopicsView.swift
//  Ogniloud
//
//  Created by IS 543 on 10/9/25.
//

import SwiftUI

struct TopicsView: View {
    
    var ogniloudViewModel: OgniloudViewModel

    @State private var expandedTopics: Set<UUID> = []

    var body: some View {
        NavigationStack {
            List {
                ForEach(ogniloudViewModel.topics, id: \.id) { topic in
                    DisclosureGroup(isExpanded: Binding(get: {
                        expandedTopics.contains(topic.id)
                    }, set: { newValue in
                        if newValue { expandedTopics.insert(topic.id) } else { expandedTopics.remove(topic.id) }
                    })) {
                        ForEach(topic.subPages, id: \.self) { page in
                            NavigationLink(destination: TopicPageView(page: page, topic: topic.title)) {
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

// I had chatGPT generate this for me
struct TopicPageView: View {
    let page: String
    let topic: String

    var body: some View {
        switch page {
        case "View Vocabulary List":
            VocabularyListView(topic: topic)
                .navigationTitle("\(topic) Vocabulary")
        case "Practice Flashcards":
            FlashcardView(topic: topic)
                .navigationTitle("\(topic) Flashcards")
        case "Lesson":
            LessonView(topic: topic)
                .navigationTitle("\(topic) Lesson")
        case "Quiz":
            QuizView(topic: topic)
                .navigationTitle("\(topic) Quiz")
        case "View Progress":
            ProgressView(topic: topic)
                .navigationTitle("\(topic) Progress")
        default:
            Text("Coming Soon")
                .navigationTitle(topic)
        }
    }
}


#Preview {
    TopicsView(ogniloudViewModel: OgniloudViewModel())
}
