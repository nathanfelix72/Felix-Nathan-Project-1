//
//  TopicsView.swift
//  Ogniloud
//
//  Created by IS 543 on 10/9/25.
//

import SwiftUI

struct TopicsView: View {
    
    // MARK: - Properties
    
    var ogniloudViewModel: OgniloudViewModel

    @State private var expandedTopics: Set<UUID> = []

    // MARK: - Body
    
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
                            NavigationLink(destination: TopicPageView(page: page, topic: topic.title, ogniloudViewModel: ogniloudViewModel)) {
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
    let ogniloudViewModel: OgniloudViewModel
    
    var body: some View {
        switch page {
        case "View Vocabulary List":
            VocabularyListView(
                topic: topic,
                terms: ogniloudViewModel.getTerms(for: topic)
            )
            .navigationTitle("\(topic) Vocabulary")
        case "Practice Flashcards":
            FlashcardView(
                viewModel: ogniloudViewModel,
                topic: topic,
                terms: ogniloudViewModel.getTerms(for: topic)
            )
            .navigationTitle("\(topic) Flashcards")
        case "Lesson":
            LessonView(
                viewModel: ogniloudViewModel,
                topic: topic,
                lessonContent: ogniloudViewModel.getLessonContent(for: topic)
            )
            .navigationTitle("\(topic) Lesson")
        case "Quiz":
            QuizView(
                viewModel: ogniloudViewModel,
                topic: topic,
                quizQuestions: ogniloudViewModel.getQuizData(for: topic)
            )
            .navigationTitle("\(topic) Quiz")
        case "View Progress":
            ProgressView(
                viewModel: ogniloudViewModel,
                topic: topic,
                progress: ogniloudViewModel.getProgress(for: topic)
            )
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
