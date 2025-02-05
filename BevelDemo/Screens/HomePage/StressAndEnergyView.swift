//
//  StressAndEnergyView.swift
//  BevelDemo
//
//  Created by David Hull on 2025-01-31.
//

import SwiftUI

struct StressAndEnergyView: View {
    var body: some View {
        VStack(spacing: 0){
            StressAndEnergyHeaderView
                .padding(.bottom, 13)
            VStack(spacing: 5) {
                StressScoreView()
                BatteryView()
            }
        }
    }
}

#Preview {
    ScrollView {
        StressAndEnergyView()
    }
    .background(Color.background)
}

private extension StressAndEnergyView {
    var StressAndEnergyHeaderView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Stress & Energy")
                    .font(UIFont.custom(size: UIFont.preferredFont(forTextStyle: .body).pointSize, weight: 0.27))
                    .fontDesign(.rounded)
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    struct StressScoreView: View {
        var body: some View {
            VStack {
                ZStack(alignment: .top) {
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                StatusUpdateView()
                                HighestLowestAverageView()
                            }
                            Spacer()
                            // Offset to fit the arrow.
                            CircleScoreView()
                                .offset(x: -4)
                        }
                    }
                    RightArrowView()
                }
                .padding()
                .background {
                    BackgroundContainerShadowView()
                }
            }
            .padding(.horizontal)
        }
    }
    
    struct RightArrowView: View {
        var body: some View {
            HStack {
                Spacer()
                Image(systemName: "arrow.forward")
                    .imageScale(.small)
                    .foregroundColor(.customGray4)
            }
        }
    }
    
    struct StatusUpdateView: View {
        @State private var isAnimating = false
        
        var body: some View {
            VStack (alignment: .leading, spacing: 2) {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.customGreen)
                            .opacity(0.3)
                            .scaleEffect(isAnimating ? 0.0 : 1)
                            .animation(
                                isAnimating ?
                                    .easeInOut(duration: 1).repeatForever(autoreverses: true) :
                                        .default,
                                value: isAnimating
                            )
                        Circle()
                            .frame(width: 7, height: 7)
                            .foregroundColor(.customGreen)
                    }
                    .onAppear {
                        isAnimating = true
                    }
                    
                    Text("Today's stress")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(Color.customGray5)
                        .bold()
                    Spacer()
                }
                Text("Last updated at 12:30 PM")
                    .bold()
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(Color.customGray3)
            }
        }
    }
    
    struct HighestLowestAverageView: View {
        var body: some View {
            HStack {
                HighestView()
                CustomDividerView()
                    .padding(.vertical, 1)
                    .padding(.horizontal, 1)
                LowestView()
                CustomDividerView()
                    .padding(.horizontal, 1)
                AverageView()
            }
            .padding(.top, 1)
        }
    }
    
    struct HighestView: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text("–")
                    .foregroundColor(Color.customGray2)
                    .bold()
                    .font(.system(.title2, design: .rounded))
                Text("Highest")
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
                    .foregroundColor(.customGray4)
                    .font(.system(.footnote, design: .rounded))
                    .bold()
            }
        }
    }
    
    struct LowestView: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text("–")
                    .foregroundColor(Color.customGray2)
                    .bold()
                    .font(.system(.title2, design: .rounded))
                Text("Lowest")
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
                    .foregroundColor(.customGray4)
                    .font(.system(.footnote, design: .rounded))
                    .bold()
            }
        }
    }
    
    struct AverageView: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text("–")
                    .foregroundColor(Color.customGray2)
                    .bold()
                    .font(.system(.title2, design: .rounded))
                Text("Average")
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
                    .foregroundColor(.customGray4)
                    .font(.system(.footnote, design: .rounded))
                    .bold()
            }
        }
    }
    
    struct CircleScoreView: View {
        var body: some View {
            ZStack {
                Circle()
                    .frame(width: 82, height: 82)
                    .foregroundColor(Color.background)
                    .shadow(color: .customGray3.opacity(0.6), radius: 5, x: 0, y: 2)
                Text("–")
                    .foregroundColor(Color.customGray5)
                    .bold()
                    .font(.system(.title2, design: .rounded))
                Circle()
                    .trim(from: 0.125, to: min(1.0, 0.125 + (75 / 100)))
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [.green, .yellow, .red]),
                            center: .center
                        ),
                        style: StrokeStyle(
                            lineWidth: 5,
                            lineCap: .butt,
                            lineJoin: .round,
                            dash: [1.5, 2]
                        )
                    )
                    .frame(width: 70, height: 70)
                    .rotationEffect(.degrees(90))
                    .opacity(0.35)
            }
        }
    }
    
    struct BatteryView: View {
        var body: some View {
            VStack {
                HStack {
                    Image(systemName: "bolt.fill")
                        .fontWeight(.heavy)
                        .imageScale(.small)
                        .foregroundColor(.red)
                    HStack(spacing: 3) {
                        ForEach(0..<43, id: \.self) { _ in
                            RoundedRectangle(cornerRadius: 5.0)
                                .frame(width: 3, height: 15)
                                .foregroundColor(Color.customGray2)
                        }
                    }
                    Spacer()
                    Text("1%")
                        .fontWeight(.medium)
                        .font(.system(.subheadline, design: .rounded))
                }
                .padding()
                .background {
                    BackgroundContainerShadowView()
                }
            }
            .padding(.horizontal)
        }
    }
}
