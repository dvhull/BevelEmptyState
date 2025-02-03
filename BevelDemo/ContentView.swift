//
//  ContentView.swift
//  BevelDemo
//
//  Created by David Hull on 2025-01-30.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeScreen()
                    .tag(0)
                Text("Journal View")
                    .tag(1)
                Text("Fitness View")
                    .tag(2)
                Text("Biology View")
                    .tag(3)
            }
            CustomTabView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}

struct CustomTabView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    selectedTab = 0
                } label: {
                    TabItem(iconName: "house.fill", label: "Home", isActive: selectedTab == 0)
                }
                Spacer()
                Button {
                    selectedTab = 1
                } label: {
                    TabItem(iconName: "text.book.closed.fill", label: "Journal", isActive: selectedTab == 1)
                }
                Spacer()
                Button {
                    selectedTab = 2
                } label: {
                    TabItem(iconName: "figure.run", label: "Fitness", isActive: selectedTab == 2)
                }
                Spacer()
                Button {
                    selectedTab = 3
                } label: {
                    TabItem(iconName: "heart.fill", label: "Biology", isActive: selectedTab == 3)
                }
            }
            .padding(.horizontal, 41)
            .padding(.vertical, 12)
            .background {
                BackgroundCapsuleShadowView()
            }
        }
        .padding(.horizontal)
    }
}

struct TabItem: View {
    var iconName: String
    var label: String
    var isActive: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "\(iconName)")
                .font(.title3)
                .foregroundColor(isActive ? .black : .customGray4)
            Text("\(label)")
                .font(.system(size: 10, weight: .medium, design: .rounded))
                .foregroundColor(isActive ? .black : .customGray4)
        }
    }
}
