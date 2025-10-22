//
//  Flashcard.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/16/25.
//

import SwiftUI

struct Flashcard: View {
    
    // MARK: - Properties
    
    let flashcard: OgniloudModel.Flashcard
    let terms: [String]
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Color.clear
        }
        .flashcardify(isFaceUp: flashcard.isFaceUp, isReviewed: flashcard.isReviewed, term1: terms[0], term2: terms[1])
        .aspectRatio(Constants.aspectRatio, contentMode: .fit)
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let aspectRatio: CGFloat = 3.0 / 4.0
    }
}

#Preview {
    Flashcard(
        flashcard: OgniloudModel.Flashcard(term: "Madre", definition: "Mother", isFaceUp: true),
        terms: ["Madre", "Mother"]
    )
    .padding()
}
