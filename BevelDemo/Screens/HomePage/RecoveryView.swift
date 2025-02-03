//
//  RecoverySection.swift
//  BevelDemo
//
//  Created by David Hull on 2025-01-30.
//

import SwiftUI

enum RecoveryCircleType: CaseIterable {
    case strain, recovery, sleep
    
    var title: String {
        switch self {
        case .strain: return "Strain"
        case .recovery: return "Recovery"
        case .sleep: return "Sleep"
        }
    }
}

struct RecoveryView: View {
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                ForEach(RecoveryCircleType.allCases, id: \.self) { type in
                    CirclesSectionView(type: type)
                        .padding(.vertical)
                    if type != RecoveryCircleType.allCases.last {
                        CustomDividerView()
                            .padding(.horizontal, 3)
                            .padding(.vertical, 12)
                    }
                }
            }
            .padding(.horizontal, 12)
            .background {
                BackgroundContainerView()
            }
        }
        .padding(.horizontal)
    }
}

private extension RecoveryView {
    struct CirclesSectionView: View {
        var type: RecoveryCircleType
        
        var body: some View {
            switch type {
            case .strain:
                VStack(spacing: 10) {
                    EmptyStateCircleView
                    Text("Strain")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(Color.customGray5)
                        .bold()
                }
            case .recovery:
                VStack(spacing: 10) {
                    EmptyStateCircleView
                    Text("Recovery")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(Color.customGray5)
                        .bold()
                }
            case .sleep:
                VStack(spacing: 10) {
                    EmptyStateCircleView
                    Text("Sleep")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(Color.customGray5)
                        .bold()
                }
            }
        }
        
        var EmptyStateCircleView: some View {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .shadow(color: Color.customGray3.opacity(0.6), radius: 7, x: 0, y: 5)
                Circle()
                    .stroke(Color.customGray1, lineWidth: 8)
                    .padding(10)
                Text("-")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.customGray2)
                + Text("%")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.customGray2)
            }
        }
    }
}

#Preview {
    ScrollView {
        RecoveryView()
    }
    .background(Color.background)
}
