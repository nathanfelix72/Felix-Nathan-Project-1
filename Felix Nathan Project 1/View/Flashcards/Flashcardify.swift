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
                    .stroke(Color.black, lineWidth: Constants.strokeWidth)
                
                if isFaceUp {
                    VStack(spacing: Constants.spacing) {
                        Text(term1)
                            .font(.largeTitle)
                            .bold()
                        if isReviewed {
                            HStack(spacing: Constants.iconSpacing) {
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
                    Text(term2)
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
    func flashcardify(isFaceUp: Bool, isReviewed: Bool, term1: String, term2: String) -> some View {
        modifier(Flashcardify(isFaceUp: isFaceUp, isReviewed: isReviewed, term1: term1, term2: term2))
    }
}
