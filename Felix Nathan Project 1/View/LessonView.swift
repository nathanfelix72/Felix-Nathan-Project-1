//
//  LessonView.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct LessonView: View {
    
    // MARK: - Properties
    
    let viewModel: OgniloudViewModel
    let topic: String
    let lessonContent: String
    
    @State private var isCompleted = false

    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(lessonContent)
                    .padding()
                
                Button(action: {
                    viewModel.markLessonComplete(for: topic)
                    isCompleted = true
                }) {
                    HStack {
                        Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                        Text(isCompleted ? "Lesson Completed" : "Mark Lesson Complete")
                    }
                }
                .disabled(isCompleted)
            }
        }
        .onAppear {
            let progress = viewModel.getProgress(for: topic)
            isCompleted = progress["Lesson"] == "Completed"
        }
    }
}

#Preview {
    LessonView(
        viewModel: OgniloudViewModel(),
        topic: "Relationships",
        lessonContent: """
        In Spanish, *mother* is _madre_ and *father* is _padre_.
        """
    )
}
