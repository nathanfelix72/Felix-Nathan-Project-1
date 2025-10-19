//
//  ProgressView.swift
//  Ogniloud
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct ProgressView: View {
    let topic: String
    let progress: [String: String]

    private var entries: [(term: String, definition: String)] {
        progress.map { (term: $0.key, definition: $0.value) }
            .sorted { $0.term < $1.term }
    }

    var body: some View {
        List(entries, id: \.term) { entry in
            HStack {
                Text(entry.term)
                    .font(.headline)
                Spacer()
                Text(entry.definition)
                    .font(.subheadline)
            }
            .padding(.vertical, 8)
        }
        .navigationTitle("\(topic) Vocabulary")
    }
}

#Preview {
    ProgressView(topic: "Sample Topic", progress: [
        "Lesson": "Not Started",
        "Quiz": "Not Started",
        "Flashcards": "0/2 reviewed"
    ])
}
