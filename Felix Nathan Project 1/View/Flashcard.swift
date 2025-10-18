//
//  Flashcard.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/16/25.
//

import SwiftUI

struct Flashcard: Animatable, View {
    let flashcard: OgniloudModel.Flashcard
    let terms: [String]
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double
    
    init(flashcard: OgniloudModel.Flashcard, terms: [String]) {
        self.flashcard = flashcard
        self.terms = terms
        self.rotation = flashcard.isFaceUp ? 0 : 180
    }

    var body: some View {
        GeometryReader { geometry in
            if !flashcard.isFaceUp {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2)

                    VStack {
                        Text(terms[0])
                            .font(.largeTitle)
                            .bold()
                    }
                }
                .padding()
                .aspectRatio(3.0 / 4.0, contentMode: .fit)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2)

                    VStack {
                        Text(terms[1])
                            .font(.largeTitle)
                            .bold()
                    }
                }
                .padding()
                .aspectRatio(3.0 / 4.0, contentMode: .fit)
            }
        }
        .rotation3DEffect(Angle(degrees: rotation), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    Flashcard(flashcard: OgniloudModel.Flashcard(isFaceUp: true), terms: ["Madre", "Mother"])
}
