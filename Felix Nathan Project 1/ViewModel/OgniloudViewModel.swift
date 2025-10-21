//
//  OgniloudViewModel.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

@Observable
class OgniloudViewModel {
    
    // MARK: - Constants
    
    private struct Constants {
        static let animationDuration = 0.5
    }
    
    // MARK: - Properties
    
    private var model = OgniloudModel(topics: spanishTopics, flashcards: [], quizQuestions: [])
    
    // MARK: - Initialization
    
    // MARK: - Model Access
    
    var topics: [OgniloudModel.OgniloudTopic] {
        model.topics
    }
    
    // MARK: - User Intents
    
    func getFlashcards(for topicTitle: String) -> [OgniloudModel.Flashcard] {
        model.topics.first(where: { $0.title == topicTitle })?.flashcards ?? []
    }
    
    func getQuizQuestions(for topicTitle: String) -> [OgniloudModel.QuizQuestion] {
        model.topics.first(where: { $0.title == topicTitle })?.quizQuestions ?? []
    }
    
    func initializeFlashcards(for topicTitle: String, count: Int) {
        model.initializeFlashcards(for: topicTitle, count: count)
    }
    
    func initializeQuizQuestions(for topicTitle: String, count: Int) {
        model.initializeQuizQuestions(for: topicTitle)
    }

    func flipCard(_ flashcard: OgniloudModel.Flashcard, in topicTitle: String) {
        withAnimation(.easeIn(duration: Constants.animationDuration)) {
            model.flipCard(flashcard, in: topicTitle)
        }
    }
    
    func markLessonComplete(for topicTitle: String) {
        model.markLessonComplete(for: topicTitle)
    }
    
    func getProgress(for topicTitle: String) -> [String: String] {
        model.topics.first(where: { $0.title == topicTitle })?.progress ?? [:]
    }
    
    func getTerms(for topicTitle: String) -> [String: String] {
        model.topics.first(where: { $0.title == topicTitle })?.terms ?? [:]
    }
    
    func getLessonContent(for topicTitle: String) -> String {
        model.topics.first(where: { $0.title == topicTitle })?.lessonContent ?? "No lesson content available."
    }
    
    func getQuizData(for topicTitle: String) -> [String: String] {
        model.topics.first(where: { $0.title == topicTitle })?.quizData ?? [:]
    }
    
    func submitQuizAnswer(for topicTitle: String, questionId: UUID, userAnswer: String, isCorrect: Bool) {
        model.submitQuizAnswer(for: topicTitle, questionId: questionId, userAnswer: userAnswer, isCorrect: isCorrect)
    }
    
    func shuffleFlashcards(for topicTitle: String) {
        model.shuffleFlashcards(for: topicTitle)
    }
    
    // ChatGPT helped me figure out what was wrong with this function
    func resetProgress(for topicTitle: String, component: String) {
        guard let topicIndex = model.topics.firstIndex(where: { $0.title == topicTitle }) else {
            return
        }
        
        if let componentEnum = OgniloudModel.LearningComponent(rawValue: component) {
            model.resetProgress(for: topicIndex, component: componentEnum)
        }
    }
    
    // MARK: - Private Helpers
}
