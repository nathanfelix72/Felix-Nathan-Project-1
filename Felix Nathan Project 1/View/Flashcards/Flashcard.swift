//
//  Flashcard.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/16/25.
//

import SwiftUI

struct Flashcard: View {
    let flashcard: OgniloudModel.Flashcard
    let terms: [String]
    
    var body: some View {
        VStack {
            Color.clear
        }
        .flashcardify(isFaceUp: flashcard.isFaceUp, term1: terms[0], term2: terms[1])
        .aspectRatio(3.0 / 4.0, contentMode: .fit)
    }
}

#Preview {
    Flashcard(flashcard: OgniloudModel.Flashcard(isFaceUp: true), terms: ["Madre", "Mother"])
        .padding()
}
