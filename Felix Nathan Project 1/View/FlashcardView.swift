//
//  FlashcardView.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct FlashcardView: View {
    let topic: String
    
    var body: some View {
        Form {
            Section(header: Text("Flashcards about \(topic)")) {
                Button(action: {
                    // NEEDSWORK
                }, label: {
                    Text("Mark Complete")
                })
            }
        }
        .navigationTitle(topic)
    }
}

#Preview {
    FlashcardView(topic: "Sample Topic")
}
