//
//  ProgressView.swift
//  Ogniloud
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct ProgressView: View {
    
    // MARK: - Properties
    
    let viewModel: OgniloudViewModel
    let topic: String
    let progress: [String: String]
    
    // MARK: - Computed Properties
    
    private var entries: [(term: String, definition: String)] {
        progress.map { (term: $0.key, definition: $0.value) }
            .sorted { $0.term < $1.term }
    }

    // MARK: - Body
    
    var body: some View {
        List(entries, id: \.term) { entry in
            HStack {
                Text(entry.term)
                    .font(.headline)
                Spacer()
                Text(entry.definition)
                    .font(.subheadline)
                Spacer()
                Button("Reset") {
                    viewModel.resetProgress(for: topic, component: entry.term)
                }
            }
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    ProgressView(
        viewModel: OgniloudViewModel(),
        topic: "Sample Topic",
        progress: [
            "Lesson": "Not Started",
            "Quiz": "Not Started",
            "Flashcards": "0/2 reviewed"
        ]
    )
}
