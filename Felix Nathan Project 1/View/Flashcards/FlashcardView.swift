//
//  FlashcardView.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct FlashcardView: View {
    
    // MARK: - Properties
    
    let viewModel: OgniloudViewModel
    let topic: String
    let terms: [String: String]
    
    @State private var currentIndex = 0
    
    // MARK: - Computed Properties
    
    private var entries: [(term: String, definition: String)] {
        terms.map { (term: $0.key, definition: $0.value) }
    }

    // MARK: - Body
    
    var body: some View {
        VStack() {
            let flashcards = viewModel.getFlashcards(for: topic)
            
            if currentIndex < flashcards.count {
                Flashcard(
                    flashcard: flashcards[currentIndex],
                    terms: [flashcards[currentIndex].term, flashcards[currentIndex].definition]
                )
                .frame(width: 250, height: 350)
                .animation(.easeInOut, value: currentIndex)
                .onTapGesture {
                    viewModel.flipCard(flashcards[currentIndex], in: topic)
                }
            }
            
            VStack(spacing: 8) {
                Text("Flashcard \(currentIndex + 1)/\(flashcards.count)")
                    .font(.headline)
                
                Text("Number Reviewed: \(flashcards.filter { $0.isReviewed }.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            
            HStack(spacing: Constants.betweenButtonPadding) {
                Button(action: {
                    viewModel.setCardFaceUp(flashcards[currentIndex], in: topic, faceUp: true)
                    currentIndex = (currentIndex - 1 + flashcards.count) % flashcards.count
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Previous")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, Constants.buttonPadding)
                    .background(currentIndex == 0 ? Color.gray.opacity(0.3) : Color.blue)
                    .foregroundColor(currentIndex == 0 ? .gray : .white)
                    .cornerRadius(10)
                }
                .disabled(currentIndex == 0)

                Button(action: {
                    viewModel.setCardFaceUp(flashcards[currentIndex], in: topic, faceUp: true)
                    currentIndex = (currentIndex + 1) % flashcards.count
                }) {
                    HStack {
                        Text("Next")
                        Image(systemName: "chevron.right")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, Constants.buttonPadding)
                    .background(currentIndex == flashcards.count - 1 ? Color.gray.opacity(0.3) : Color.blue)
                    .foregroundColor(currentIndex == flashcards.count - 1 ? .gray : .white)
                    .cornerRadius(Constants.cornerRadius)
                }
                .disabled(currentIndex == flashcards.count - 1)
            }
            .padding(.horizontal)
            
            HStack(spacing: Constants.betweenButtonPadding) {
                Button(action: {
                    viewModel.markAllFlashcards(for: topic, reviewed: true)
                }) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("All Reviewed")
                    }
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, Constants.buttonPadding)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(Constants.cornerRadius)
                }
                
                Button(action: {
                    viewModel.markAllFlashcards(for: topic, reviewed: false)
                }) {
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                        Text("All Unreviewed")
                    }
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, Constants.buttonPadding)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(Constants.cornerRadius)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: Constants.betweenButtonPadding) {
                Button(action: {
                    viewModel.toggleSingleFlashcard(for: topic, flashcardId: flashcards[currentIndex].id)
                }) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Toggle This Card")
                    }
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, Constants.buttonPadding)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(Constants.cornerRadius)
                }
                
                Button(action: {
                    viewModel.shuffleFlashcards(for: topic)
                    currentIndex = 0
                }) {
                    HStack {
                        Image(systemName: "shuffle")
                        Text("Shuffle")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, Constants.buttonPadding)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(Constants.cornerRadius)
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .onAppear {
            viewModel.shuffleFlashcards(for: topic)
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let buttonPadding = 12.0
        static let cornerRadius = 10.0
        static let betweenButtonPadding = 16.0
    }
}

#Preview {
    FlashcardView(viewModel: OgniloudViewModel(), topic: "Relationships", terms: [
        "Madre": "Mother",
        "Padre": "Father",
        "Hermano": "Brother",
        "Hermana": "Sister",
    ])
}
