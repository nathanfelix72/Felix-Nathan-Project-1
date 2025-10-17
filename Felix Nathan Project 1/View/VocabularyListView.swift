//
//  VocabularyList.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct VocabularyListView: View {
    let topic: String
    
    var body: some View {
        HStack {
            Form {
                Section(header: Text("\(topic)")) {
                    List {
                        
                    }
                }
            }
            .navigationTitle(topic)
            Form {
                Section(header: Text("\(topic)")) {
                    List {
                        
                    }
                }
            }
            .navigationTitle(topic)
        }
    }
}

#Preview {
    VocabularyListView(topic: "Sample Topic")
}
