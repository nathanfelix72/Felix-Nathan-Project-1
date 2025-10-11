//
//  IndividualTopicView.swift
//  Ogniloud
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct IndividualTopicView: View {
    let topic: String
    
    var body: some View {
        Form {
            Section(header: Text("Lesson about \(topic)")) {
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
    IndividualTopicView(topic: "Sample Topic")
}
