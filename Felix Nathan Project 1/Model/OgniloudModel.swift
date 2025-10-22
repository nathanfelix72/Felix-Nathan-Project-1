//
//  OgniloudModel.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import Foundation

struct OgniloudModel: Codable {
    
    // MARK: - Properties
    
    private(set) var topics: [OgniloudTopic]
    
    // MARK: - User Intents
    
    mutating func flipCard(_ flashcard: Flashcard, in topicTitle: String) {
        if let topicIndex = topics.firstIndex(where: { $0.title == topicTitle }),
           let cardIndex = topics[topicIndex].flashcards.firstIndex(where: { $0.id == flashcard.id }) {
            topics[topicIndex].flashcards[cardIndex].isFaceUp.toggle()
            topics[topicIndex].flashcards[cardIndex].isReviewed = true
            
            updateFlashcardProgress(for: topicIndex)
        }
    }
    
    mutating func markAllFlashcards(for topicTitle: String, reviewed: Bool) {
        if let index = topics.firstIndex(where: { $0.title == topicTitle }) {
            for i in topics[index].flashcards.indices {
                topics[index].flashcards[i].isReviewed = reviewed
            }
            updateFlashcardProgress(for: index)
        }
    }
    
    mutating func markLessonComplete(for topicTitle: String, completed: Bool) {
        if let index = topics.firstIndex(where: { $0.title == topicTitle }) {
            if completed == true {
                topics[index].progress["Lesson"] = "Completed"
            } else {
                topics[index].progress["Lesson"] = "Not Started"
            }
        }
    }
    
    mutating func resetProgress(for topicIndex: Int, component: TopicComponent) {
        switch component {
        case .lesson:
            topics[topicIndex].progress["Lesson"] = "Not Started"
            
        case .quiz:
            for i in topics[topicIndex].quizQuestions.indices {
                topics[topicIndex].quizQuestions[i].userAnswer = nil
                topics[topicIndex].quizQuestions[i].hasSubmitted = false
                topics[topicIndex].quizQuestions[i].answeredCorrectly = false
            }
            topics[topicIndex].progress["Quiz"] = "0/\(topics[topicIndex].quizQuestions.count) correct"
            
        case .flashcards:
            for i in topics[topicIndex].flashcards.indices {
                topics[topicIndex].flashcards[i].isReviewed = false
                topics[topicIndex].flashcards[i].isFaceUp = true
            }
            topics[topicIndex].progress["Flashcards"] = "0/\(topics[topicIndex].flashcards.count) reviewed"
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
    
    mutating func shuffleFlashcards(for topicTitle: String) {
        if let index = topics.firstIndex(where: { $0.title == topicTitle }) {
            topics[index].flashcards.shuffle()
        }
    }
    
    mutating func updateHighScore(for topicTitle: String, score: Int) {
        if let topicIndex = topics.firstIndex(where: { $0.title == topicTitle }) {
            if score > topics[topicIndex].quizHighScore {
                topics[topicIndex].quizHighScore = score
            }
        }
    }
    
    // MARK: - Private Helpers
    
    private mutating func updateFlashcardProgress(for topicIndex: Int) {
        let reviewedCount = topics[topicIndex].flashcards.filter { $0.isReviewed }.count
        let totalCount = topics[topicIndex].flashcards.count
        topics[topicIndex].progress["Flashcards"] = "\(reviewedCount)/\(totalCount) reviewed"
    }
    
    private mutating func updateQuizProgress(for topicIndex: Int) {
        let correctCount = topics[topicIndex].quizQuestions.filter { $0.answeredCorrectly }.count
        let totalCount = topics[topicIndex].quizQuestions.count
        topics[topicIndex].progress["Quiz"] = "\(correctCount)/\(totalCount) correct"
    }
    
    // MARK: - Nested Types
    
    enum TopicComponent: String, CaseIterable, Codable {
        case lesson = "Lesson"
        case quiz = "Quiz"
        case flashcards = "Flashcards"
    }
    
    struct OgniloudTopic: Identifiable, Codable {
        var id = UUID()
        var title: String
        var terms: [String: String]
        var lessonContent: String
        var quizData: [String: String]
        var quizHighScore: Int
        var progress: [String: String]
        var flashcards: [Flashcard]
        var quizQuestions: [QuizQuestion]
        var subPages: [String]
        
        init(title: String, terms: [String: String], lessonContent: String, quizData: [String: String], quizHighScore: Int, progress: [String: String], subPages: [String]) {
            self.id = UUID()
            self.title = title
            self.terms = terms
            self.lessonContent = lessonContent
            self.quizData = quizData
            self.quizHighScore = quizHighScore
            self.progress = progress
            self.subPages = subPages
            
            let termEntries = terms.map { (term: $0.key, definition: $0.value) }
            self.flashcards = termEntries.map { entry in
                Flashcard(term: entry.term, definition: entry.definition, isFaceUp: true)
            }.shuffled()
            
            self.quizQuestions = quizData.shuffled().map { (question, answer) in
                QuizQuestion(question: question, correctAnswer: answer, answeredCorrectly: false)
            }
        }
    }
    
    struct Flashcard: Identifiable, Codable {
        var id = UUID()
        var term: String
        var definition: String
        var isFaceUp = false
        var isReviewed = false
    }
    
    struct QuizQuestion: Identifiable, Codable {
        var id = UUID()
        var question: String
        var correctAnswer: String
        var userAnswer: String? = nil
        var hasSubmitted: Bool = false
        var answeredCorrectly = false
    }
}
