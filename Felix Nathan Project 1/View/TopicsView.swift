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
    @State private var expandedTopic: UUID? = nil

    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(ogniloudViewModel.topics, id: \.id) { topic in
                    DisclosureGroup(isExpanded: Binding(
                        get: { expandedTopic == topic.id },
                        set: { isExpanding in
                            expandedTopic = isExpanding ? topic.id : nil
                        }
                    )) {
                        // View Vocabulary List
                        NavigationLink {
                            VocabularyListView(
                                topic: topic.title,
                                terms: ogniloudViewModel.getTerms(for: topic.title)
                            )
                            .navigationTitle("\(topic.title) Vocabulary")
                        } label: {
                            Text("View Vocabulary List")
                        }
                        
                        // Practice Flashcards
                        NavigationLink {
                            FlashcardView(
                                viewModel: ogniloudViewModel,
                                topic: topic.title,
                                terms: ogniloudViewModel.getTerms(for: topic.title)
                            )
                            .navigationTitle("\(topic.title) Flashcards")
                        } label: {
                            Text("Practice Flashcards")
                        }
                        
                        // Lesson
                        NavigationLink {
                            LessonView(
                                viewModel: ogniloudViewModel,
                                topic: topic.title,
                                lessonContent: ogniloudViewModel.getLessonContent(for: topic.title)
                            )
                            .navigationTitle("\(topic.title) Lesson")
                        } label: {
                            Text("Lesson")
                        }
                        
                        // Quiz
                        NavigationLink {
                            QuizView(
                                viewModel: ogniloudViewModel,
                                topic: topic.title,
                                quizQuestions: ogniloudViewModel.getQuizData(for: topic.title)
                            )
                            .navigationTitle("\(topic.title) Quiz")
                        } label: {
                            Text("Quiz")
                        }
                        
                        // View Progress
                        NavigationLink {
                            ProgressView(
                                viewModel: ogniloudViewModel,
                                topic: topic.title,
                                progress: ogniloudViewModel.getProgress(for: topic.title)
                            )
                            .navigationTitle("\(topic.title) Progress")
                        } label: {
                            Text("View Progress")
                        }
                    } label: {
                        HStack {
                            Text(topic.title)
                                .font(.headline)
                        }
                    }
                }
                
                Button("Reset To Defaults") {
                    ogniloudViewModel.resetToDefaults()
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Topics")
        }
    }
}

#Preview {
    TopicsView(ogniloudViewModel: OgniloudViewModel())
}
