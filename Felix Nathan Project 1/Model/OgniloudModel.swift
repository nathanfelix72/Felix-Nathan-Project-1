//
//  OgniloudModel.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import Foundation

struct OgniloudModel {
    var topics: [OgniloudTopic]
    var flashcards: Array<Flashcard>
    var quizQuestions: Array<QuizQuestion>
    
    mutating func flipCard(_ flashcard: Flashcard, in topicTitle: String) {
        if let topicIndex = topics.firstIndex(where: { $0.title == topicTitle }),
           let cardIndex = topics[topicIndex].flashcards.firstIndex(where: { $0.id == flashcard.id }) {
            topics[topicIndex].flashcards[cardIndex].isFaceUp.toggle()
            topics[topicIndex].flashcards[cardIndex].hasReviewed = true
            
            updateFlashcardProgress(for: topicIndex)
        }
    }
    
    mutating func initializeFlashcards(for topicTitle: String, count: Int) {
        if let index = topics.firstIndex(where: { $0.title == topicTitle }) {
            if topics[index].flashcards.isEmpty {
                topics[index].flashcards = (0..<count).map { _ in
                    Flashcard(isFaceUp: true)
                }
                topics[index].progress["Flashcards"] = "0/\(count) reviewed"
            }
        }
    }
    
    mutating func initializeQuizQuestions(for topicTitle: String) {
        if let index = topics.firstIndex(where: { $0.title == topicTitle }) {
            if topics[index].quizQuestions.isEmpty {
                let quizData = topics[index].quizData
                topics[index].quizQuestions = quizData.map { (question, answer) in
                    QuizQuestion(question: question, correctAnswer: answer, answeredCorrectly: false)
                }
                topics[index].progress["Quiz"] = "0/\(quizData.count) correct"
            }
        }
    }
    
    mutating func markLessonComplete(for topicTitle: String) {
        if let index = topics.firstIndex(where: { $0.title == topicTitle }) {
            topics[index].progress["Lesson"] = "Completed"
        }
    }
    
    mutating func submitQuizAnswer(for topicTitle: String, questionId: UUID, userAnswer: String, isCorrect: Bool) {
        if let topicIndex = topics.firstIndex(where: { $0.title == topicTitle }),
           let questionIndex = topics[topicIndex].quizQuestions.firstIndex(where: { $0.id == questionId }) {
            topics[topicIndex].quizQuestions[questionIndex].userAnswer = userAnswer
            topics[topicIndex].quizQuestions[questionIndex].answeredCorrectly = isCorrect
            
            updateQuizProgress(for: topicIndex)
        }
    }

    private mutating func updateQuizProgress(for topicIndex: Int) {
        let correctCount = topics[topicIndex].quizQuestions.filter { $0.answeredCorrectly }.count
        let totalCount = topics[topicIndex].quizQuestions.count
        topics[topicIndex].progress["Quiz"] = "\(correctCount)/\(totalCount) correct"
    }
    
    private mutating func updateFlashcardProgress(for topicIndex: Int) {
        let reviewedCount = topics[topicIndex].flashcards.filter { $0.hasReviewed }.count
        let totalCount = topics[topicIndex].flashcards.count
        topics[topicIndex].progress["Flashcards"] = "\(reviewedCount)/\(totalCount) reviewed"
    }
    
    struct OgniloudTopic: Identifiable {
        var id = UUID()
        var title: String
        var terms: [String: String]
        var lessonContent: String
        var quizData: [String: String]
        var progress: [String: String]
        var flashcards: [Flashcard] = []
        var quizQuestions: [QuizQuestion] = []
        var subPages: [String]
    }
    
    struct Flashcard: Identifiable {
        fileprivate(set) var id = UUID()
        fileprivate(set) var isFaceUp = false
        fileprivate(set) var hasReviewed = false
    }
    
    struct QuizQuestion: Identifiable {
        fileprivate(set) var id = UUID()
        fileprivate(set) var question: String
        fileprivate(set) var correctAnswer: String
        fileprivate(set) var userAnswer: String? = nil
        fileprivate(set) var hasSubmitted: Bool = false
        fileprivate(set) var answeredCorrectly = false
    }
}
