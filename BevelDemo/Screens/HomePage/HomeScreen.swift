//
//  HomeScreen.swift
//  BevelDemo
//
//  Created by David Hull on 2025-01-31.
//

import SwiftUI

/// - Note: `Screen` suffix defines a full page, while `View` suffix defines a subview of a screen.
struct HomeScreen: View {
    var body: some View {
        ZStack {
            BackgroundView
            VStack(spacing: 0) {
                HeaderView
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 33) {
                        RecoveryView()
                            .padding(.top, 12)
                        StressAndEnergyView()
                        HealthMonitorView()
                        ActivitiesView()
                    }
                }
            }
            // Added extra padding to align with the original design, which doesn't follow built-in padding.
            .padding(.horizontal, 2)
            .refreshable {
                // TODO: Add custom refresh view.
            }
        }
    }
}

/// - Note: All subviews used exclusively within this view are encapsulated in an extension.
/// This improved readability and prevents name clashes by keeping them scoped to HomeScreen.
private extension HomeScreen {
    var HeaderView: some View {
        HStack {
            Button {
                // TODO: Add functionality.
            } label: {
                Text("Today, February 2")
                    .font(UIFont.custom(size: 19, weight: 0.27))
                    .fontDesign(.rounded)
                    .foregroundColor(.black)
                Image(systemName: "chevron.down")
                    .foregroundColor(Color.customGray4)
                    .imageScale(.small)
            }
            Spacer()
            Button {
                // TODO: Add functionality.
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.customBlue1)
                    Text("DH")
                        .font(.caption2)
                        .foregroundColor(.customBlue2)
                }
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.white)
        .overlay {
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.customGray2)
            }
        }
    }
    
    var BackgroundView: some View {
        Color.background
            .ignoresSafeArea()
    }
}

#Preview {
    HomeScreen()
}
