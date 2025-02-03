//
//  ContentView.swift
//  BevelDemo
//
//  Created by David Hull on 2025-01-30.
//

import SwiftUI

enum Tab: Int, CaseIterable {
    case home, journal, fitness, biology
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .journal: return "Journal"
        case .fitness: return "Fitness"
        case .biology: return "Biology"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .journal: return "text.book.closed.fill"
        case .fitness: return "figure.run"
        case .biology: return "heart.fill"
        }
    }
}

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeScreen()
                    .tag(Tab.home)
                Text("Journal View")
                    .tag(Tab.journal)
                Text("Fitness View")
                    .tag(Tab.fitness)
                Text("Biology View")
                    .tag(Tab.biology)
            }
            CustomTabView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        selectedTab = tab
                    } label: {
                        TabItem(tab: tab, isActive: selectedTab == tab)
                    }
                    if tab != Tab.allCases.last {
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 41)
            .padding(.vertical, 12)
            .background(BackgroundCapsuleShadowView())
        }
        .padding(.horizontal)
    }
}

struct TabItem: View {
    let tab: Tab
    let isActive: Bool
    
    var body: some View {
        VStack {
            Image(systemName: tab.icon)
                .font(.title3)
                .foregroundColor(isActive ? .black : .customGray4)
            Text(tab.title)
                .font(.system(size: 10, weight: .medium, design: .rounded))
                .foregroundColor(isActive ? .black : .customGray4)
        }
    }
}
