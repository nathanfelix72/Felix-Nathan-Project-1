//
//  Flashcardify.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/17/25.
//

import SwiftUI

struct Flashcardify: Animatable, ViewModifier {
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double
    var term1: String
    var term2: String
    
    init(isFaceUp: Bool, term1: String, term2: String) {
        rotation = isFaceUp ? 0 : 180
        self.term1 = term1
        self.term2 = term2
    }

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
                
                if isFaceUp {
                    Text(term1)
                        .font(.largeTitle)
                        .bold()
                } else {
                    Text(term2)
                        .font(.largeTitle)
                        .bold()
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
                }
            }
        }
        .rotation3DEffect(Angle(degrees: rotation), axis: (x: 0, y: 1, z: 0))
    }
}

extension View {
    func flashcardify(isFaceUp: Bool, term1: String, term2: String) -> some View {
        modifier(Flashcardify(isFaceUp: isFaceUp, term1: term1, term2: term2))
    }
}
