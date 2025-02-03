//
//  BevelDemoApp.swift
//  BevelDemo
//
//  Created by David Hull on 2025-01-30.
//

import SwiftUI

@main
struct BevelDemoApp: App {
    init() {
        // Hide the original TabBar.
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
            
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
