//
//  TopicsView.swift
//  Ogniloud
//
//  Created by IS 543 on 10/9/25.
//

import SwiftUI

struct TopicsView: View {
    
    // MARK: - Properties
    
    var ogniloudViewModel: OgniloudViewModel

    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                let isLandscape = geometry.size.width > geometry.size.height
                
                ScrollView {
                    LazyVGrid(columns: isLandscape ? [
                        GridItem(),
                        GridItem(),
                        GridItem()
                    ] : [
                        GridItem(),
                        GridItem()
                    ]) {
                        ForEach(ogniloudViewModel.topics, id: \.id) { topic in
                            NavigationLink {
                                TopicDetailView(
                                    ogniloudViewModel: ogniloudViewModel,
                                    topic: topic
                                )
                            } label: {
                                VStack {
                                    Image(topic.title)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: Constants.imageCornerRadius))
                                    
                                    Text(topic.title)
                                        .font(.title2)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.primary)
                                }
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(Constants.cornerRadius)
                            }
                        }
                    }
                    .padding()
                    
                    Button("Reset To Defaults") {
                        ogniloudViewModel.resetToDefaults()
                    }
                    .padding()
                }
                .navigationTitle("Topics")
            }
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let cornerRadius = 12.0
        static let imageCornerRadius = 8.0
    }
}

#Preview {
    TopicsView(ogniloudViewModel: OgniloudViewModel())
}
