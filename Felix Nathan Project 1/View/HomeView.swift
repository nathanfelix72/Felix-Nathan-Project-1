//
//  HomeView.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/11/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List() {
                NavigationLink(destination: TopicsView()) {
                    Text("View All Topics")
                }
            }
            .navigationTitle("Activities")
            
        }
    }
}

#Preview {
    HomeView()
}
