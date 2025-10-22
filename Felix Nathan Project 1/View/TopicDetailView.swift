//
//  TopicDetailView.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/21/25.
//

import SwiftUI

struct TopicDetailView: View {
    var ogniloudViewModel: OgniloudViewModel
    var topic: OgniloudModel.OgniloudTopic
    
    var body: some View {
        List {
            NavigationLink {
                VocabularyListView(
                    topic: topic.title,
                    terms: topic.terms
                )
                .navigationTitle("Vocabulary")
            } label: {
                Label("View Vocabulary List", systemImage: "list.bullet")
            }
            
            NavigationLink {
                FlashcardView(
                    viewModel: ogniloudViewModel,
                    topic: topic.title,
                    terms: topic.terms
                )
                .navigationTitle("Flashcards")
            } label: {
                Label("Practice Flashcards", systemImage: "rectangle.stack")
            }
            
            NavigationLink {
                LessonView(
                    viewModel: ogniloudViewModel,
                    topic: topic.title,
                    lessonContent: topic.lessonContent
                )
                .navigationTitle("Lesson")
            } label: {
                Label("Lesson", systemImage: "book")
            }
            
            NavigationLink {
                QuizView(
                    viewModel: ogniloudViewModel,
                    topic: topic.title,
                    quizQuestions: topic.quizData
                )
                .navigationTitle("\(topic.title) Quiz")
            } label: {
                Label("Quiz", systemImage: "questionmark.circle")
            }
            
            NavigationLink {
                ProgressView(
                    viewModel: ogniloudViewModel,
                    topic: topic.title,
                    progress: topic.progress
                )
                .navigationTitle("Progress")
            } label: {
                Label("View Progress", systemImage: "chart.bar")
            }
        }
        .navigationTitle(topic.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        TopicDetailView(
            ogniloudViewModel: OgniloudViewModel(),
            topic: OgniloudModel.OgniloudTopic(
                title: "Sample Topic",
                terms: ["Term 1": "Definition 1"],
                lessonContent: "Sample lesson",
                quizData: ["Question": "Answer"],
                quizHighScore: 0,
                progress: ["Lesson": "Not Started"],
                subPages: []
            )
        )
    }
}
