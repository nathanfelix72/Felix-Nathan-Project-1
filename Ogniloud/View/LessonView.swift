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
                Text(.init(lessonContent))
                    .padding()
                
                Button(action: {
                    viewModel.markLessonComplete(for: topic, completed: !isCompleted)
                    isCompleted.toggle()
                }) {
                    HStack {
                        Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                        Text(isCompleted ? "Lesson Completed" : "Mark Lesson Complete")
                    }
                }
                .padding()
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
