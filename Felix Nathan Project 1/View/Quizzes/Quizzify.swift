//
//  Quizzify.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/18/25.
//

import SwiftUI

struct Quizzify: Animatable, ViewModifier {

    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double
    var question: String
    var correctAnswer: String
    var answeredCorrectly: Bool

    init(question: String, correctAnswer: String, answeredCorrectly: Bool) {
        rotation = answeredCorrectly ? 0 : 180
        self.question = question
        self.correctAnswer = correctAnswer
        self.answeredCorrectly = answeredCorrectly
    }

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
                
                if answeredCorrectly {
                    VStack(spacing: 8) {
                        Text(question)
                            .font(.largeTitle)
                            .bold()
                        if answeredCorrectly {
                            HStack(spacing: 6) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text("Reviewed")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding()
                } else {
                    Text(correctAnswer)
                        .font(.largeTitle)
                        .bold()
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
                        .padding()
                }
            }
        }
        .rotation3DEffect(Angle(degrees: rotation), axis: (x: 0, y: 1, z: 0))
    }
}

extension View {
    func quizzify(question: String, correctAnswer: String, answeredCorrectly: Bool) -> some View {
        modifier(Quizzify(question: question, correctAnswer: correctAnswer, answeredCorrectly: answeredCorrectly))
    }
}
