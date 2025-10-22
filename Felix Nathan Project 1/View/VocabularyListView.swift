//
//  VocabularyList.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct VocabularyListView: View {
    
    // MARK: - Properties
    
    let topic: String
    let terms: [String: String]

    // MARK: - Computed Properties
    
    private var entries: [(term: String, definition: String)] {
        terms.map { (term: $0.key, definition: $0.value) }
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
            }
            .padding(.vertical, 8)
        }
        .navigationTitle("\(topic) Vocabulary")
    }
}

#Preview {
    VocabularyListView(
        topic: "Food",
        terms: [
            "Manzana": "Apple",
            "Pan": "Bread",
            "Queso": "Cheese",
            "Carne": "Meat",
            "Pollo": "Chicken",
            "Agua": "Water",
            "Leche": "Milk",
            "Pescado": "Fish",
            "Fruta": "Fruit",
            "Verdura": "Vegetable",
            "Cebolla": "Onion",
            "Tomate": "Tomato",
            "Arroz": "Rice",
            "Sopa": "Soup",
            "Huevos": "Eggs"
        ]
    )
}
