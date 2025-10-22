//
//  Flashcardify.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/17/25.
//

import SwiftUI

struct Flashcardify: Animatable, ViewModifier {
    
    // MARK: - Constants
    
    private struct Constants {
        static let cornerRadius = 25.0
        static let strokeWidth = 2.0
        static let iconSpacing = 6.0
        static let spacing = 8.0
        static let starSize = 24.0
        static let starPadding = 12.0
    }
    
    // MARK: - Properties
    
    var rotation: Double
    var term1: String
    var term2: String
    var isReviewed: Bool
    
    // MARK: - Computed Properties
    
    var isFaceUp: Bool { rotation < 90 }

    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    // MARK: - Initialization

    init(isFaceUp: Bool, isReviewed: Bool, term1: String, term2: String) {
        rotation = isFaceUp ? 0 : 180
        self.term1 = term1
        self.term2 = term2
        self.isReviewed = isReviewed
    }

    // MARK: - Body
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(isReviewed ? Color.green : Color.black, lineWidth: Constants.strokeWidth)
                    .shadow(color: isReviewed ? Color.green.opacity(0.6) : Color.clear, radius: 8, x: 0, y: 0)
                
                if isFaceUp {
                    VStack(spacing: Constants.spacing) {
                        Text(term1)
                            .font(.largeTitle)
                            .bold()
                    }
                    .padding()
                } else {
                    VStack(spacing: Constants.spacing) {
                        Text(term2)
                            .font(.largeTitle)
                            .bold()
                            .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
                    }
                    .padding()
                }
                
                if isReviewed {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "star.fill")
                                .font(.system(size: Constants.starSize))
                                .foregroundColor(.yellow)
                                .padding(Constants.starPadding)
                        }
                        Spacer()
                    }
                }
            }
        }
        .rotation3DEffect(Angle(degrees: rotation), axis: (x: 0, y: 1, z: 0))
    }
}

extension View {
    func flashcardify(isFaceUp: Bool, isReviewed: Bool, term1: String, term2: String) -> some View {
        modifier(Flashcardify(isFaceUp: isFaceUp, isReviewed: isReviewed, term1: term1, term2: term2))
    }
}
