//
//  HealthMonitorView.swift
//  BevelDemo
//
//  Created by David Hull on 2025-01-31.
//

import SwiftUI

struct HealthMonitorView: View {
    var body: some View {
        VStack(spacing: 0) {
            HealthMonitorHeaderView
                .padding(.bottom, 13)
            TilesView
            MissingDataView
        }
    }
}

#Preview {
    ScrollView {
        HealthMonitorView()
    }
    .background(Color.background)
}

private extension HealthMonitorView {
    struct CardView: View {
        var title: String
        var sfSymbol: String
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: sfSymbol)
                        .font(.subheadline)
                        .imageScale(.small)
                        .foregroundColor(.customGray3)
                    Text(title)
                        .font(.system(.subheadline, design: .rounded))
                        .bold()
                        .foregroundColor(.customGray4)
                    Spacer()
                    Circle()
                        .frame(width: 6, height: 6)
                        .foregroundColor(.customGray2)
                }
                .padding(.bottom)
                Text("No\ndata")
                    .font(.system(.title3, design: .rounded))
                    .bold()
                    .foregroundColor(.customGray3)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(5)
            }
            .frame(width: 100)
            .padding(10)
            .background {
                BackgroundContainerShadowView()
            }
        }
    }
    
    var HealthMonitorHeaderView: some View {
        HStack {
            Text("Health Monitor")
                .font(UIFont.custom(size: UIFont.preferredFont(forTextStyle: .body).pointSize, weight: 0.27))
                .fontDesign(.rounded)
            Spacer()
            Button {
                // Dummy button doesn't do anything.
            } label: {
                HStack(spacing: 0) {
                    Text("Edit ")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.customGray4)
                    Image(systemName: "chevron.forward")
                        .imageScale(.small)
                        .fontWeight(.medium)
                        .foregroundColor(Color.customGray4)
                }
            }
        }
        .padding(.horizontal)
    }
    
    var TilesView: some View {
        // This is hardcoded it doesn't change.
        ScrollView(.horizontal) {
            HStack(spacing: 2) {
                CardView(title: "RHR", sfSymbol: "heart.fill")
                CardView(title: "RR", sfSymbol: "lungs.fill")
                CardView(title: "HRV", sfSymbol: "waveform.path.ecg")
                CardView(title: "SpO2", sfSymbol: "drop.degreesign.fill")
            }
            .padding(.horizontal)
            .padding(.bottom, 12)
        }
        .scrollIndicators(.hidden)
    }
    
    var MissingDataView: some View {
        VStack {
            HStack {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color.customGray4)
                Text("There are some missing data metrics.")
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.customGray4)
                Spacer()
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 7.0)
                    .foregroundColor(Color.customGray1)
            }
        }
        .padding(.horizontal)
    }
}
